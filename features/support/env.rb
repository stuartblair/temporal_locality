require 'aruba'
def stub_bin
	File.join(File.dirname(__FILE__), '..', '..', 'stubbed_binaries')
end

@dirs = [stub_bin]
ENV['PATH'] = "#{stub_bin}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
