import lxml.etree as macro

def main(args):
    dom = macro.parse(args.input[0])
    xslt = macro.parse("../../include/converter.xsl")
    transform = macro.XSLT(xslt)
    new_dom = transform(dom)
    args.output[0].write(macro.tostring(new_dom, pretty_print=True))
    args.input[0].close()
    args.output[0].close()