$LOAD_PATH << File.expand_path(File.join(__FILE__, '..', '..', 'lib', 'temporal_locality'))

module TemporalLocality
	EmptyTable = Object.new
	EmptyChangeset = Object.new
end

def empty_table
	TemporalLocality::EmptyTable
end

def empty_changeset
	TemporalLocality::EmptyChangeset
end

def multiple_changesets_containing_only(file)
end
