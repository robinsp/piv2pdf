require 'spec_helper'

require 'piv_2_pdf/csv'

describe Piv2Pdf::Csv, "using canned csv file" do
  let(:filename) { "#{SPEC_RESOURCES}/sample.csv" }

  it "should have 10 items" do
    csv = Piv2Pdf::Csv.new(filename)
    csv.should have(9).items
  end

end
