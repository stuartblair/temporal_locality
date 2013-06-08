class AsciiTable
	def to_array(table_source)
		result = []

		with_each_line_in(table_source) do |row|
			result << with_each_cell_in(row) do |cell|
				cell.strip 
			end
		end
	
		return at_least_an_empty_2d_array(result)
	end

	private

	def at_least_an_empty_2d_array(result)
		result == [] ? [[]] : result
	end


	def with_each_line_in(table_source)
		with_each_table_row_in(table_source) do |row|
			yield row.split(/\s*\|\s*/)		
		end
	end

	def with_each_cell_in(row)
		row.map do |cell|
			yield cell
		end
	end

	def with_each_table_row_in(table_source)
		table_source.strip.each_line do |row|
			yield row.chomp.sub(/^\|(.*)\|/, '\1')
		end
	end
end
