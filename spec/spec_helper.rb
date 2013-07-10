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

def single_change_history
<<-EOS
------------------------------------------------------------------------
r8 | sally | 2002-07-14 08:15:29 -0500 | 1 line
Changed paths:
M file_a
M file_b

Frozzled the sub-space winch.

------------------------------------------------------------------------
EOS
end


