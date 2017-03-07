require "gorgon/core_ext/hash/deep_merge"
require "yajl"

module Gorgon
  module Configuration
    extend self

    def load_configuration_from_file(first_filename, merge: nil)
      merge_filename = merge

      load_file(first_filename).deep_merge(load_file(merge_filename))
    end

    private

    def load_file(filename)
      return {} if filename.nil?

      file = File.new(filename, "r")
      Yajl::Parser.new(symbolize_keys: true).parse(file)
    end
  end
end

