require 'date'
require 'yaml'

module Tivitylog
  class Logger
    attr_reader :filename

    def initialize(filename=default_filename)
      @filename = filename
      File.open(filename, 'a'){ |f| f.write("---\n") } unless File.exist?(filename)
    end

    def entry(data)
      File.open(filename, 'a') do |f|
        f.write([data].to_yaml.gsub("---\n", ''))
      end
    end

    private

    def default_filename
      @default_filename ||= "#{DateTime.now.strftime('%Y%m%d')}activitylog.yaml"
    end
  end
end
