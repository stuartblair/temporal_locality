require "temporal_locality/version"
require 'temporal_locality/reporter'

module TemporalLocality
	class TemporalLocality
		def report
puts """
| resource |   | 1   | 2   |
| file_a   | 1 | x   | 100 |
| file_b   | 2 | 100 | x   |
"""
		end
	end
end

TemporalLocality::TemporalLocality.new.report

