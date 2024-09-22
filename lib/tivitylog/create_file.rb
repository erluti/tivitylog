require 'etc'

module Tivitylog
  class CreateFile
    attr_reader :logger, :filename
    def initialize(filename, logger = Logger.new)
      @logger = logger
      @filename = filename
    end

    def perform
      start = Time.now
      File.open(filename, "w") {}
      logger.entry({
        path: filename, # full path
        activity: 'create'
      })
    end
  end
end