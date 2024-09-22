require 'etc'

module Tivitylog
  class ModifyFile
    attr_reader :logger, :filename
    def initialize(filename, logger = Logger.new)
      @logger = logger
      @filename = filename
    end

    def perform
      start = Time.now
      File.open(filename, "a") { |f| f.write "File Modified." }
      logger.entry({
        path: filename, # full path
        activity: 'modify'
      })
    end
  end
end