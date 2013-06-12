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

