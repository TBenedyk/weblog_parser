# frozen_string_literal: true

require_relative 'refinements/hash'

class LogStats
  using HashRefinements

  attr_reader :entries

  def initialize(entries:)
    @entries = entries
  end

  def analyze(unique:)
    entry_data.count_values(unique).sort_by_value(:desc)
  end

  private

  def entry_data
    entries.each_with_object({}) do |entry, hash|
      (hash[entry.page] ||= []) << entry.ip_addr
    end
  end
end
