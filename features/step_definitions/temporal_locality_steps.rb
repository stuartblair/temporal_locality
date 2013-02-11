Given /^a revision history consisting of a single change set with two files$/ do
	revision_history_with{change_set_with{two_files}}
end

When /^the temporal coupling analysis is performed$/ do
	steps %{
	When I run `temporal_coupling_analysis `
	}
end

Then /^the coupling report shows both files are totally coupled to each other$/ do
	coupling_report_shows(both_files_are_totally_coupled)
end

