require 'yaml'
require 'hashie'

module EgoSearch
  Config = Hashie::Mash.new ::YAML::load File.open(File.expand_path "../config.yml", File.dirname(__FILE__)).read
end
