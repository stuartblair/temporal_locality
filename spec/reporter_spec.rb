require 'spec_helper'
require 'reporter'

describe TemporalLocality::Reporter do 
	describe '#report' do
		context 'when version control reports no changesets' do
			before(:each) do
				@version_control_adapter = double('version_control_adapter')
				@version_control_adapter.stub(:changesets).and_return(empty_changeset)
				@view = double('view')
				@report = TemporalLocality::Reporter.new(@version_control_adapter, @view)
			end

			it 'renders a view with no rows' do
				@view.should_receive(:render).with(empty_table)
				@report.report
			end
		end
	end
end
