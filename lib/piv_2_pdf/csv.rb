require 'fastercsv'

module Piv2Pdf
  class Csv
    attr_reader :items
    
    def initialize(csv_filename)
      @items = []
      FasterCSV.table(csv_filename).each do |row|
        @items << TrackerItem.new(row)
      end
    end
  end
end
