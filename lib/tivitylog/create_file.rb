require 'etc'

module Tivitylog
  class CreateFile
    attr_reader :logger, :filename
    def initialize(filename)
      @logger = Logger.new
      @filename = filename
    end

    def perform
      start = Time.now
      File.open(filename, "w") {}
      logger.entry(
        {
          timestamp: start,
          path: filename, # full path
          activity: 'create',
          username: Etc.getlogin,
          process: Process.argv0.split(' ').first, #name of command
          command_ine: Process.argv0,
          pid: Process.pid
      })
    end
  end
end