module TemporalLocality
	class Reporter
		def initialize(version_control_adapter, view)
			@view = view
		end

		def report
			@view.render(TemporalLocality::EmptyTable)
		end
	end
end

