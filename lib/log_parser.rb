# frozen_string_literal: true

require_relative 'log_entry'

class LogParser
  def initialize(file)
    @file = file
    @entries = []
  end

  def self.call(file:)
    new(file).call
  end

  def call
    parse_file
    entries
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  attr_reader :entries, :file

  private

  def parse_file
    lines.each do |line|
      entries << log_entry(line)
    end
  end

  def lines
    File.readlines(file)
  end

  def log_entry(line)
    page, ip_addr = line.split(' ')
    LogEntry.new(page: page, ip_addr: ip_addr)
  end
end
