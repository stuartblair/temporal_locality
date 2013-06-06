class AsciiMatrix
	def to_matrix(ascii_source)
		if empty_table?(ascii_source) then 
			return empty_matrix
		end

		result = []

		ascii_source = ascii_source.strip
		ascii_source.each_line do |row|
			result << row.split('|').reject do |element| 
				element == "|" || element == "\n" || element == ""
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
end
