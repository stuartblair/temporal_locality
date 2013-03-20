Feature: Report temporal coupling
	As a concerned software craftsman finding themselves with a long-lived big ball of mud
	I want to identify the most temporally coupled files within my version control system
	So that I can target cross-module dependencies as potential candidates for re-homing
	
	Scenario: A revision history with a single change set containing two files
		Given a revision history consisting of a single change set with two files
		When the temporal coupling analysis is performed
		Then the coupling report shows both files are totally coupled to each other


