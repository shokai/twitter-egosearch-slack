require "mongoid"

Mongoid.logger.level = Logger::WARN
Mongoid.load! File.expand_path("../mongoid.yml", File.dirname(__FILE__))
