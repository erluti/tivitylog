require 'date'

module Tivitylog
  class Logger
    attr_reader :filename

    def initialize(filename=default_filename)
      @filename = filename
    end

    def default_filename
      @default_filename ||= "#{DateTime.now.strftime('%Y%m%d')}activitylog.yaml"
    end
  end
end
