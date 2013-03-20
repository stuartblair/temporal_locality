Given /^a revision history consisting of a single change set with two files$/ do
	revision_history_with{change_set_with_two_files}
end

When /^the temporal coupling analysis is performed$/ do
	steps %{
		When I run `temporal_locality http://svnurl`
	}
end

Then /^the coupling report shows both files are totally coupled to each other$/ do
	steps %{
		Then it should pass with:
		"""
		Temporal Coupling
		*****************
		source, target, couplings, strength
		file_a, file_b, 1, 1
		"""
	}
end

