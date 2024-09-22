module Tivitylog
  class RunProcess
    attr_reader :command, :logger
    def initialize(command, logger = Logger.new)
      @command = command
      @logger = logger
    end

    def perform
      system(command)
      logger.entry
    end
  end
end
