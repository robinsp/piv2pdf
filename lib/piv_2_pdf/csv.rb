require 'fastercsv'

module Piv2Pdf
  class Csv
    attr_reader :items
    
    def initialize(csv_filename)
      @items = FasterCSV.table(csv_filename)
    end
  end
end
