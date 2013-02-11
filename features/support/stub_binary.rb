module TemporalLocality
	module Test
		module StubbedBinary
			def stub_binary(name)
				File.new(name, "w") do |file|
					yield file
				end
				file.chmod(0755)
			end

			def that_outputs
				puts "stuff"
			end
		end
	end
end

