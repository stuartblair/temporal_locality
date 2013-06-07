class AsciiMatrix
	def to_matrix(ascii_source)
		if empty_table?(ascii_source) then 
			return empty_matrix
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

	def empty_matrix
		[[]]
	end

	def with_each_row_in(table_source, &block)
		table_source.strip.each_line do |row|
			parsed_cells =  row.split('|').reject do |element| 
				element == "|" || element == "\n" || element == ""
			end 
			yield parsed_cells
		end
	end

	def with_each_cell_in(row, &block)
		row.map do |cell|
			yield cell
		end
	end
end
