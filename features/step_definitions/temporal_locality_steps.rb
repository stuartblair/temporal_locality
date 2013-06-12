Given /^a revision history consisting of a single change set with two files$/ do
	revision_history_with{single_change_set_with_two_files}
end

Given /^a revision history consisting of two change sets with disjoint sets of files$/ do
	revision_history_with{two_change_sets_with_disjoint_sets_of_files}
end

When /^the temporal coupling analysis is performed$/ do
	steps %{
		When I run `temporal_locality http://svnurl`
	}
end

Then /^the coupling report looks like:$/ do |expected_table|
	ascii_table = AsciiTable.new
	actual_table = Cucumber::Ast::Table.new(ascii_table.to_array(all_output))
	actual_table.diff!(expected_table)
end

