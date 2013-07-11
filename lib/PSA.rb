require "PSA/version"
require "net/http"

module Intercom
  class PSA
    def initialize(uri)
      @uri = uri
    end

    def broadcast(msg,voice=nil)
      url = URI(@uri)
      msg = "#{msg} -v #{voice}" if voice
      url.query = URI.encode_www_form({:message=>"#{msg}"})

      res = Net::HTTP.get_response(url)
      puts res.body if res.is_a?(Net::HTTPSuccess)
    end

    def alert(length=1)
      msg = "ah " * length
      broadcast(msg,"Bells")
    end
  end
end
