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

    VOICES = ["Agnes","Albert","Alex","Bad News","Bahh","Bells","Boing","Bruce","Bubbles","Cellos","Deranged","Fred","Good News","Hysterical","Junior","Kathy","Pipe Organ","Princess","Ralph","Trinoids","Vicki","Victoria","Whisper","Zarvox"]

    VOICES.each_with_index do |voice_name, i|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{voice_name.downcase.tr(' ','_')}(msg)
            broadcast(msg,"#{voice_name}")
          end
        RUBY
      end
  end
end
