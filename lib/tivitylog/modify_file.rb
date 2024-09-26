module Tivitylog
  class ModifyFile
    attr_reader :logger, :filename
    def initialize(filename, logger = Logger.new)
      @logger = logger
      @filename = filename
    end

    def perform
      File.open(filename, "a") { |f| f.write "File Modified." }
      logger.entry({
        path: File.expand_path(filename),
        file_activity: 'modify'
      })
    end
  end
end