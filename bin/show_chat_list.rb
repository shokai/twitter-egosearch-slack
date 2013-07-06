#!/usr/bin/env ruby
require 'rubygems'
require 'skype'

puts "Skype Chat IDs"
Skype.chats.each do |chat|
  puts "-"*5
  puts "#{chat.id}"
  chat.messages.reverse[0...3].each do |m|
    puts m
  end
end
