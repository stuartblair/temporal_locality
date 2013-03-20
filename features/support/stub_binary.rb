def stub_binary(name)
	FileUtils.mkdir(stub_binary_path)
	File.open(File.join(stub_binary_path, name), "w") do |file|
		file.puts "#!/usr/bin/env ruby"
		file.puts "puts \"#{yield}\""
		file.chmod(0755)
	end
end

def stub_binary_path
	File.join(File.dirname(__FILE__), '..', '..', 'stubbed_binaries')
end

def clear_filesystem(file_system)
	FileUtils.rm_rf(file_system)
end
