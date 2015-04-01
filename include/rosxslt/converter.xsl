<x:stylesheet version="1.0"
  xmlns:x="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xacro="http://ros.org/wiki/xacro"
  exclude-result-prefixes="xsl"
  >


  <x:namespace-alias result-prefix="xsl" stylesheet-prefix="xsl"/>
  <x:template match="robot">
    <x:element name="xsl:stylesheet">
      <x:attribute name="version">1.0</x:attribute>
      <x:apply-templates select="node()|@*"/>
    </x:element>
  </x:template>

  <x:template match="node()|@*">
      <x:copy>
        <x:apply-templates select="node()|@*"/>
      </x:copy>
  </x:template>

  <x:template match="property/@value">
    <x:attribute name="select">
      <x:text>'</x:text>
      <x:value-of select="."/>
      <x:text>'</x:text>
    </x:attribute>
  </x:template>

  <x:template match="xacro:property/@value">
    <x:attribute name="select">
      <x:text>'</x:text>
      <x:value-of select="."/>
      <x:text>'</x:text>
    </x:attribute>
  </x:template>

  <x:template match="property">
    <x:element name="xsl:variable">
      <x:apply-templates select="node()|@*"/>
    </x:element>
  </x:template>

  <x:template match="xacro:property">
    <x:element name="xsl:variable">
      <x:apply-templates select="node()|@*"/>
    </x:element>
  </x:template>

</x:stylesheet>


<!--xsl:template match="property">
  <xsl:text>true</xsl:text>
</xsl:template-->
