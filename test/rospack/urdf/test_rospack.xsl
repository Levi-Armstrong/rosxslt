<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:ros="http://wiki.ros.org/rosxslt"
>
  <xsl:variable name="pkg_name" select="'rosxslt'" />
  <xsl:variable name="env_name" select="'HOME'" />

  <xsl:template name="test_rospack_commands" match="/">
    <robot name="test_rospack_commands">
      <findpkg argument="{$pkg_name}">
        <xsl:value-of select="ros:find($pkg_name)"/>
      </findpkg>
      <findenv argument="{$env_name}">
        <xsl:value-of select="ros:env($env_name)"/>
      </findenv>
      <findoptenv1 argument="JUNK">
        <xsl:value-of select="ros:optenv('JUNK', 'rospack', 'roscore')"/>
      </findoptenv1>
      <findoptenv2 argument="HOME">
        <xsl:value-of select="ros:optenv('HOME', 'rospack', 'roscore')"/>
      </findoptenv2>
    </robot>
  </xsl:template>
</xsl:stylesheet>
