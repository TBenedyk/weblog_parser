# frozen_string_literal: true

require_relative './lib/log_parser'
require_relative './lib/log_stats'

entries = LogParser.call(file: ARGV[0])
stats = LogStats.new(entries: entries)

puts 'Total Visits:'

stats.analyze(unique: false).each do |page|
  puts "#{page.join(' - ')} Visits"
end

puts "\nUnique Visits:"

stats.analyze(unique: true).each do |page|
  puts "#{page.join(' - ')} Visits"
end
