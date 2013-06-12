def revision_history_with
	stub_binary("svn") do 
		yield
	end
end

def single_change_set_with_two_files
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

def two_change_sets_with_disjoint_sets_of_files
<<-EOS
------------------------------------------------------------------------
r8 | sally | 2002-07-14 08:15:29 -0500 | 1 line
Changed paths:
M coupled_a
M coupled_b

Frozzled the sub-space winch.

------------------------------------------------------------------------
r7 | sally | 2002-07-14 07:15:29 -0500 | 1 line
Changed paths:
M uncoupled

My comment is here.

------------------------------------------------------------------------
EOS
end

