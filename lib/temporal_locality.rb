require "temporal_locality/version"

module TemporalLocality
  puts """
| resource |   | 1   | 2   |
| file_a   | 1 | x   | 100 |
| file_b   | 2 | 100 | x   |
"""
end
