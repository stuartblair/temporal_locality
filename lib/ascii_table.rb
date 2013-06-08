class AsciiTable
	def to_array(ascii_source)
		if empty_table?(ascii_source) then 
			return empty_2d_array
		end

		result = []

		with_each_row_in(ascii_source) do |row|
			result << with_each_cell_in(row) do |cell|
				cell.strip 
			end
		end
	
		return result
	end

	private

	def empty_table?(ascii_source)
		return ascii_source == "" || ascii_source == "||"  
	end

	def empty_2d_array
		[[]]
	end

	def with_each_row_in(table_source)
		with_each_table_row_in(table_source) do |row|
			parsed_cells = row.split(/\s*\|\s*/)			
			yield parsed_cells
		end
	end

	def with_each_cell_in(row)
		row.map do |cell|
			yield cell
		end
	end

	def with_each_table_row_in(table_source)
		table_source.strip.each_line do |row|
			row = row.chomp.sub(/^\|(.*)\|/, '\1')
			yield row
		end
	end
end
