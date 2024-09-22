require 'date'
require 'yaml'

module Tivitylog
  class Logger
    attr_reader :filename

    def initialize(process_details = {}, filename: default_filename)
      @filename = filename
      File.open(filename, 'a'){ |f| f.write("---\n") } unless File.exist?(filename)
      @process_details = process_details
    end

    def entry(data)
      entry_data = data.merge(@process_details)
      File.open(filename, 'a') do |f|
        f.write([entry_data].to_yaml.gsub("---\n", ''))
      end
    end

    private

    def default_filename
      @default_filename ||= "#{DateTime.now.strftime('%Y%m%d')}activitylog.yaml"
    end
  end
end
