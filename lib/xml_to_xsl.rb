#!/usr/bin/env ruby

# file: xml_to_xsl.rb

require 'rexle'


class XMLToXSL

  attr_reader :to_xsl

  def initialize(xml)

    doc = Rexle.new(xml)

  @to_xsl = "<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'"\
  " version='1.0'>

  <xsl:template match='#{doc.root.name}'>

    <xsl:element name='#{doc.root.name}'>
  #{write_attributes(doc.root.attributes).join("\n")}
      #{build_xml(doc.root)}
    </xsl:element>

  </xsl:template>

</xsl:stylesheet>"

  end
  
  private


  def build_xml(node)

    r = []

    previous_name = ''


    node.elements.each do |child| 


      if child.children.length > 1 

        r << build_template(child)

        r << build_xml(child) 

      else

        r << build_value(child,node) if child.name != previous_name

        previous_name = child.name

      end

    end
    r.join

  end      

  def build_template(element)

    "<xsl:apply-templates select='#{element.name}' />
    </xsl:element>

  </xsl:template>

  <xsl:template match='#{element.name}'>"

  end

  def build_value(element,parent)

  "\n
    <xsl:element name='#{parent.name}'>
#{write_attributes(parent.attributes).join("\n")}
      <xsl:apply-templates select='#{element.name}' />
    </xsl:element>

  </xsl:template>

  <xsl:template match='#{element.name}'>

    <xsl:element name='#{element.name}'>
#{write_attributes(element.attributes).join("\n")}
      <xsl:value-of select='.' />"

  end

  def write_attributes(attr)
    
    attr.map do |key, val|
      "      <xsl:attribute name='#{key}'>
        <xsl:value-of select='@#{key}'/>
      </xsl:attribute>"
    end
    
  end

end
