module TemporalLocality
	class Configuration
		def initialize(args=ARGV)
			@options =  {}
			parse_options(args)
		end

		def change_history_source
			@options[:svn_repository]
		end

		private

		def parse_options(args)
			optparse = OptionParser.new do |opts|
				opts.on("--svn_repository SVN_REPOSITORY", "Gather history from this repository") do |svn_repository|
					@options[:svn_repository] = svn_repository
				end
			end
			optparse.parse!(args)
		end
	end
end

