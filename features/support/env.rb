$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'aruba'
require_relative 'stub_binary'
require 'ascii_table'

Before do
	  @dirs = ["./stubbed_binaries"]
end

ENV['PATH'] = "./bin#{File::PATH_SEPARATOR}#{File.dirname(__FILE__)}/../../stubbed_binaries#{File::PATH_SEPARATOR}#{ENV['PATH']}"
puts "path is #{ENV['PATH']}"
