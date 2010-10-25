require 'spec_helper'

require 'piv_2_pdf/tracker_item'

describe Piv2Pdf::TrackerItem do
  
  it "should be initialized with something that responds to [](key), like a Hash" do
    good = {:k => "val"}
    good.should respond_to(:[])
    Piv2Pdf::TrackerItem.new(good)

    bad = 123.0
    bad.should_not respond_to(:[])
    lambda { Piv2Pdf::TrackerItem.new(bad) }.should raise_error(Piv2Pdf::TrackerItem::MSG_UNSUPPORTED_TYPE)
  end
  
  it "should provide reader methods corresponding to the keys in the underlying hash-like object" do
    values = {"key_one" => 1, :key_two => "two"}
    item = Piv2Pdf::TrackerItem.new(values)
    item.key_one.should == 1
    item.key_two.should == "two"
  end

  it "should override #id" do
    values = {:id => 101}
    item = Piv2Pdf::TrackerItem.new(values)
    item.id.should == 101
  end

  it "should override #description" do
    values = {:description => 0}
    item = Piv2Pdf::TrackerItem.new(values)
    item.description.should == ""
  end
  

end
