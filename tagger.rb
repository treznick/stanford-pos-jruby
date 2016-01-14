require 'java'
require 'stanford-postagger.jar'
Dir[File.join(File.dirname(__FILE__),"lib", "*.jar")].each do |file|
  require file
end

properties_hash = {
  "outputFormat" => "xml",
  "model" => "models/english-bidirectional-distsim.tagger"
}

properties = java.util.Properties.new
properties_hash.each do |key, value|
  properties.setProperty(key.to_java(:string),value.to_java(:string))
end

config = Java::EduStanfordNlpTaggerMaxent::TaggerConfig.new(properties)

tagger = Java::EduStanfordNlpTaggerMaxent::MaxentTagger.new(config)

puts tagger.tagString("Here's a tagged string.")

