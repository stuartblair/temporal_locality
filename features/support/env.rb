$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'aruba'
require 'temporal_locality'
require_relative 'stub_binary'

World(TemporalLocality)

def gem_bin_path
	File.dirname(__FILE__) + '../../bin'
end

@dirs = [stub_binary_path]
ENV['PATH'] = "#{gem_bin_path}/#{stub_binary_path}/#{ENV['PATH']}"
