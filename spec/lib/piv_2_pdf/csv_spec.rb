require 'spec_helper'

require 'piv_2_pdf/csv'

describe Piv2Pdf::Csv, "using canned csv file" do
  let(:filename) { "#{SPEC_RESOURCES}/sample.csv" }

  it "should have 10 items" do
    csv = Piv2Pdf::Csv.new(filename)
    csv.should have(9).items
  end

  describe "a created item" do
    # Id,Story,L,Story Type,Estimate,Current State,Created at,Accepted at,Deadline,Requested By,Owned By,Description,URL

    let(:item) { Piv2Pdf::Csv.new(filename).items[0] }

    
    %w{id story story_type estimate current_state requested_by owned_by description}.each do |attr|
      it "should have attribute :#{attr}" do
        pending
        item.should respond_to(attr.to_sym)
      end
    end
    
  end
  
end
