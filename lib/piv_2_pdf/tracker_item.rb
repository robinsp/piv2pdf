module Piv2Pdf
  class TrackerItem
    MSG_UNSUPPORTED_TYPE = "I want an object that responds to [](key)"

    def initialize(hash_like_object)
      raise MSG_UNSUPPORTED_TYPE  unless hash_like_object.respond_to?(:[])
      @values = hash_like_object
    end

    def method_missing(sym)
      return @values[sym.to_s]
    end
  end
end
