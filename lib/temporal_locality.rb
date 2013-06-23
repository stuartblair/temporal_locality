require "temporal_locality/version"

module TemporalLocality
	class TemporalLocality
		def initialize
			@occurrences = {}
			@options = {}
			parse_options(ARGV)
		end

		def parse_options(args)
			optparse = OptionParser.new do |opts|
				opts.on("--svn_repository SVN_REPOSITORY", "Gather history from this repository") do |svn_repository|
					@options[:svn_repository] = svn_repository
				end
			end
			optparse.parse!(args)
		end


		def report
			change_sets.each do |change_set|
				with_each_resource_from(change_set) do |resource_a|
					with_each_resource_from(change_set) do |resource_b|
						record_locality(resource_a, resource_b)
					end
				end
			end

			render_view
		end

		def change_sets
			`svn log #{@options[:svn_repository]}`.split(/^-+$/)
		end

		def with_each_resource_from(change_set)
			change_set.split(/\n/).each do |line|
				match_result = line.match(/^M (.+)$/)
				yield match_result[1] if match_result
			end
		end

		def record_locality(resource_a, resource_b)
			if (!@occurrences[resource_a]) 
				@occurrences[resource_a] = {}
			end

			if (!@occurrences[resource_a][resource_b])
				@occurrences[resource_a][resource_b] = 0
			end

			@occurrences[resource_a][resource_b] += 1
		end

		def render_view
			puts header(@occurrences) + rows(@occurrences)
		end

		def header(occurrences)
			resource_numbering = (1..occurrences.size).collect do |resource_number| "   #{resource_number} |" end
			"| resource |     |" + resource_numbering.join + "\n"
		end

		def rows(occurrences)
			body = ""
			index = 0
			occurrences.each_pair do |resource_a, occurrences_for_resource_a|
				body += "|  #{resource_a} |   #{index += 1 } |"
					occurrences_for_resource_a.each_pair do |resource_b, occurrences_for_resource_b|
						body += "  #{resource_a == resource_b ? "x" : occurrences_for_resource_b * 100} |"
					end
				body += "\n"
			end
			return body
		end
	end
end


