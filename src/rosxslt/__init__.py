import lxml.etree as macro
import lxml.isoschematron as iso_macro
import StringIO
import sys
import os
import rospkg

from rosgraph.names import load_mappings

# Dictionary of substitution args
substitution_args_context = {}
includes = []
namespaces = {'xsl': 'http://www.w3.org/1999/XSL/Transform', 'ros' : 'http://wiki.ros.org/rosxslt'}
rospack = rospkg.RosPack()

def set_substitution_args_context(context={}):
    substitution_args_context['arg'] = iso_macro.stylesheet_params(**context)

def get_disclaimer(file_name):
    disclaimer="<?xml version='1.0' encoding='ASCII'?>\n"
    disclaimer+="<!-- %s -->\n" % ('=' * 83)
    disclaimer+="<!-- |    This document was auto generated by rosxslt from %-27s | -->\n" % file_name
    disclaimer+="<!-- |    EDITING THIS FILE BY HAND IS NOT RECOMMENDED     %-27s | -->\n" % ""
    disclaimer+="<!-- %s -->\n" % ('=' * 83)
    return disclaimer

def get_includes(xslt):
    inc = xslt.findall('xsl:include', namespaces)
    for i in inc:
        file_xslt = i.get('href')
        includes.append(file_xslt)
        try:
            tmp_xslt = macro.parse(file_xslt)
            get_includes(tmp_xslt)
        except macro.XMLSyntaxError, e:
            sys.stderr.write("XML Syntax Error.  Check that:\n")
            sys.stderr.write(" - Your XSLT is correctly formed\n")
            sys.stderr.write(" - File: " + file_xslt + "\n")
            raise e

def find_pkg(context, pkg_name):
    return rospack.get_path(pkg_name)

def find_env(context, env_name):
    try:
        return os.environ[env_name]
    except KeyError as e:
        print "enviroment variable %s is not set." % str(e)
        raise e

def find_optenv(context, env_name, *args):
    print env_name
    if env_name in os.environ:
        return os.environ[env_name]
    elif len(args)>=1:
        return ' '.join(args[:])
    else:
        return ''

class FindPkgResolver(macro.Resolver):
    def resolve(self, url, pubid, context):
        prefix = "rospkg:"
        if url.startswith(prefix):
            folders = url.split('/')
            pkg_name = folders[0][len(prefix):]
            pkg_path = rospack.get_path(pkg_name)
            file_path = pkg_path + url[len(prefix + pkg_name):]
            return self.resolve_file(open(file_path), context, base_url=url)

def main(args):

    parser = macro.XMLParser()
    parser.resolvers.add(FindPkgResolver())

    ns = macro.FunctionNamespace('http://wiki.ros.org/rosxslt')
    ns.prefix ='ros'
    ns['find'] = find_pkg
    ns['env'] = find_env
    ns['optenv'] = find_optenv

    # Process substitution args
    set_substitution_args_context(load_mappings(args.param))

    f = StringIO.StringIO('<junk></junk>')
    dom = macro.parse(f)
    xsl_path = os.path.abspath(args.input[0].name)

    try:
        xslt = macro.parse(args.input[0], parser)
        #get_includes(xslt)
    except macro.XMLSyntaxError, e:
        sys.stderr.write("XML Syntax Error.  Check that:\n")
        sys.stderr.write(" - Your XSLT is correctly formed\n")
        sys.stderr.write(" - File: " + xsl_path + "\n")
        raise e

    try:
        transform = macro.XSLT(xslt)
    except macro.XSLTParseError, e:
        sys.stderr.write("XSLT Parsing Error.  Check that:\n")
        sys.stderr.write(" - Your XSLT is correctly formed\n")
        sys.stderr.write(" - File: " + xsl_path + "\n")
        raise e

    try:
        new_dom = transform(dom, **substitution_args_context['arg'])
    except macro.XSLTApplyError, e:
        raise e

    args.output.write(get_disclaimer(os.path.basename(xsl_path)))
    args.output.write(macro.tostring(new_dom, pretty_print=True))
    args.input[0].close()
    args.output.close()
