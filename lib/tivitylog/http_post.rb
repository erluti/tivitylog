require 'socket'
require 'uri'

module Tivitylog
  class HttpPost
    attr_reader :logger
    def initialize(_args, logger = Logger.new)
      @logger = logger
    end

    def perform
      uri = URI('https://httpbin.org/get')
      protocol = 'HTTP/1.1'
      path = uri.path

      content = <<~CONTENT.gsub("\n", "\r\n")
        GET /get #{protocol}
        Host: #{uri.hostname}
        User-Agent: tivitylog/0.0.0
        Connection: close

      CONTENT

      response = nil
      source_address = nil
      source_port = nil
      destination_address = nil
      destination_port = nil
      TCPSocket.open('httpbin.org', 80) do |sock|
        sock.print content
        source_address = sock.addr[2]
        source_port = sock.addr[1]
        destination_address = sock.peeraddr[2]
        destination_port = sock.peeraddr[1]
        response = sock.read
      end

      logger.entry({
        destination: { address: destination_address, port: destination_port },
        source: { address: source_address, port: source_port },
        data_size: content.size,
        protocol: protocol
      })
    end
  end
end