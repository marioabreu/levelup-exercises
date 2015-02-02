require 'json'
require_relative 'entry'

class DataParser
  def initialize(data: '')
    @data = data
  end

  def parse
    JSON.parse(data).map { |entry| Entry.new(date: entry["date"], cohort: entry["cohort"], result: entry["result"]) }
  end

  private

  attr_reader :data
end
