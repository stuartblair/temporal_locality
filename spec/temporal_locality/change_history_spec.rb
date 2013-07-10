require "spec_helper"
require "change_history"

describe TemporalLocality::ChangeHistory do
	describe "full_history" do
		context "with a single changeset in a svn revision repository" do
			before(:each) do
				svn_adapter = double('svn_adapter')
				svn_adapter.stub(:log).and_return(single_change_history)
				@change_history = TemporalLocality::ChangeHistory.new(svn_adapter, "change_history_source")
			end

			it "contains a single changeset" do
				@change_history.full_history.size.should eql 1
			end
		end
	end
end

