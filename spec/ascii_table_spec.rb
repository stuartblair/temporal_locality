require 'ascii_table'

describe AsciiTable do
	describe 'to_array' do
		def ascii_table
			@ascii_table
		end

		before(:each) do
			@ascii_table = AsciiTable.new
		end

		it 'returns an empty 2 dimensional array when passed an empty string' do
			ascii_table.to_array("").should eql [[]]
		end
		
		it 'returns an empty 2 dimensional array when passed an empty table' do
			ascii_table.to_array("||").should eql [[]]
		end

		it 'returns a array populated with one row for a table with one row' do
			ascii_table.to_array("|1|2|3|4|").should eql [["1","2","3","4"]]
		end

		it 'returns a array populated with multiple rows' do
			ascii_table.to_array("|1|2|3|\n|4|5|6|").should eql [["1","2","3"],["4","5","6"]]
		end

		it 'returns multiple-character elements' do
			ascii_table.to_array("|ab|12|3|").should eql [["ab","12","3"]]
		end

		it 'only parses lines that start and end with |' do
			ascii_table.to_array("\n|a|").should eql [["a"]]
		end

		it 'strips leading and trailing whitespace from cell contents' do
			ascii_table.to_array("| a|   b  |").should eql [["a","b"]]
		end
	end
end
