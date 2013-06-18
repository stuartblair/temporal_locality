require "temporal_locality/version"

module TemporalLocality
	class TemporalLocality
		def report
			render_view
			
		end

		def render_view
puts """
| resource |   | 1   | 2   |
| file_a   | 1 | x   | 100 |
| file_b   | 2 | 100 | x   |
"""
		end
	end
end

TemporalLocality::TemporalLocality.new.report

