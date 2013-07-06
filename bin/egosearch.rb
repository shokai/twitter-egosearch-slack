#!/usr/bin/env ruby
require "rubygems"
require "bundler"
Bundler.require
$:.unshift File.expand_path "../", File.dirname(__FILE__)
require "inits/db"
require "inits/config"
require "models/tweet"
require "libs/crawler"
require "libs/skype"

crawler = EgoSearch::Crawler.new

crawler.on :crawl do |word, tweet|
  puts "[crawl:#{word}] - #{tweet}"
end

crawler.on :new do |word, tweet|
  puts "[new:#{word}] - #{tweet}"
  EgoSearch::Skype.post "(beer) #{word} (beer)\n#{tweet.text}\n#{tweet.time}\n#{tweet.url}"
end

crawler.on :error do |err|
  STDERR.puts err
end

crawler.start
