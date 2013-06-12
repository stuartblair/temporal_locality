Feature: Report temporal coupling
	As a concerned software craftsman finding themselves with a long-lived big ball of mud
	I want to identify the most temporally coupled files within my version control system
	So that I can target cross-module dependencies as potential candidates for re-homing
	
	Scenario: A revision history with a single change set containing two files
		Given a revision history consisting of a single change set with two files
		When the temporal coupling analysis is performed
		Then the coupling report looks like:
			| resource |     |   1 |   2 |  
			|   file_a |   1 |   x | 100 |
			|   file_b |   2 | 100 |   x |

		@WIP
	Scenario: Resources with no temporal coupling
		Given a revision history consisting of two change sets with disjoint sets of files
		When the temporal coupling analysis is performed
		Then the coupling report looks like:
			|  resource |     |   2 |   2 |   3 |
			| coupled_a |   1 |   x | 100 |   0 |
			| coupled_b |   2 | 100 |   x |   0 |
			| uncoupled |   3 |   0 |   0 |   x |

