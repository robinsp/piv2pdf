require 'erb'

module Piv2Pdf
  class Renderer
    def initialize(item_array)
      @items = item_array
    end

    def render
      template_file = File.dirname(__FILE__) + "/tracker_item.rhtml"
      template = File.open(template_file).readlines.join(' ')

      rhtml = ERB.new(template)
      rhtml.result(binding)
    end
    
  end
end
