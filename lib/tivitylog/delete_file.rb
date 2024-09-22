module Tivitylog
  class DeleteFile
    attr_reader :logger, :filename
    def initialize(filename, logger = Logger.new)
      @logger = logger
      @filename = filename
    end

    def perform
      File.delete(filename) if File.exist?(filename)
      logger.entry({
        path: filename, # full path
        activity: 'delete'
      })
    end
  end
end