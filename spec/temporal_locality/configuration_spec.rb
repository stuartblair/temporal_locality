require "spec_helper"
require "configuration"

describe TemporalLocality::Configuration do
	describe "change_history_source" do
		context "when svn_repository option is provided" do
			before(:each) do
				@configuration = TemporalLocality::Configuration.new(%w[--svn_repository http://svnurl])
			end

			it 'should provide a subversion repository URL' do
				@configuration.change_history_source.should eql "http://svnurl"
			end
		end
	end
end

