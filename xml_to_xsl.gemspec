Gem::Specification.new do |s|
  s.name = 'xml_to_xsl'
  s.version = '0.1.0'
  s.summary = 'Creates XSLT from XML'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.signing_key = '../privatekeys/xml_to_xsl.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/xml_to_xsl'
end
