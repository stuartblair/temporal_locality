module TemporalLocality
	class ChangeHistory
		def initialize(svn_adapter, change_history_source)
			@changesets = parse_changesets_from(svn_adapter, change_history_source)
		end

		def full_history
			@changesets
		end

		private 

		def parse_changesets_from(svn_adapter, change_history_source)
			svn_history = svn_adapter.log(svn_adapter, change_history_source).split(/^-+$/)
			puts "svn_history: <#{svn_history}>"
			svn_history.reject! do |element|
				element.chomp.empty?
			end
			svn_history.map do |svn_changeset_text|
				ChangeSet.new(svn_changeset_text)
			end
		end
	end

	class ChangeSet
		def initialize(text)
			puts "<#{text}>"
		end
	end
end

