# Introducing the xml_to_xsl gem

    require 'xml_to_xsl'

    xml = "<doc>
      <klass name='SimpleNumber'>
        <def name='initialize' scope='private'></def>
        <def name='add' scope='public'></def>
        <def name='multiply' scope='public'></def>
        <def name='divide' scope='private'></def>
        <def name='square' scope='protected'></def>
      </klass>
    </doc>"

    puts XMLToXSL.new(xml).to_xsl

output:
<pre>
&lt;xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'&gt;

  &lt;xsl:template match='doc'&gt;

    &lt;xsl:element name='doc'&gt;
  
      &lt;xsl:apply-templates select='klass' /&gt;
    &lt;/xsl:element&gt;

  &lt;/xsl:template&gt;

  &lt;xsl:template match='klass'&gt;

    &lt;xsl:element name='klass'&gt;
      &lt;xsl:attribute name='name'&gt;
        &lt;xsl:value-of select='@name'/&gt;
      &lt;/xsl:attribute&gt;
      &lt;xsl:apply-templates select='def' /&gt;
    &lt;/xsl:element&gt;

  &lt;/xsl:template&gt;

  &lt;xsl:template match='def'&gt;

    &lt;xsl:element name='def'&gt;
      &lt;xsl:attribute name='name'&gt;
        &lt;xsl:value-of select='@name'/&gt;
      &lt;/xsl:attribute&gt;
      &lt;xsl:attribute name='scope'&gt;
        &lt;xsl:value-of select='@scope'/&gt;
      &lt;/xsl:attribute&gt;
      &lt;xsl:value-of select='.' /&gt;
    &lt;/xsl:element&gt;

  &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
</pre>

## Resources

* [xml_to_xsl](https://rubygems.org/gems/xml_to_xsl)

xmltoxsl gem xslt xml xml_to_xsl
