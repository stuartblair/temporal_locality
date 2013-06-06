Given /^a revision history consisting of a single change set with two files$/ do
	revision_history_with{single_change_set_with{two_files}}
end

When /^the temporal coupling analysis is performed$/ do
	steps %{
		When I run `temporal_locality http://svnurl`
	}
end

Then /^the coupling report looks like:$/ do |expected_table|
	ascii_matrix = AsciiMatrix.new
	matrix_output = ascii_matrix.to_matrix(all_output) 
	actual_table = Cucumber::Ast::Table.new(matrix_output)
	#actual_table = Cucumber::Ast::Table.new([["resource", "", "1", "2"], ["file_a", "1", "x", "100"], ["file_b", "2", "100", "x"]])
	actual_table.diff!(expected_table)
end

