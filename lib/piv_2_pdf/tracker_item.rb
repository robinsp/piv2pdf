require 'cgi'

module Piv2Pdf
  class TrackerItem
    MSG_UNSUPPORTED_TYPE = "I want an object that responds to [](key)"
    attr_reader :values
    def initialize(hash_like_object)
      raise MSG_UNSUPPORTED_TYPE  unless hash_like_object.respond_to?(:[])
      @values = hash_like_object
    end

    def id
      @values[:id]
    end

    def description
      if @values[:description] == 0
        return ""
      else

        CGI.escapeHTML(@values[:description] )
      end
    end

    def method_missing(sym)
      return (@values[sym] || @values[sym.to_s])
    end
  end
end
