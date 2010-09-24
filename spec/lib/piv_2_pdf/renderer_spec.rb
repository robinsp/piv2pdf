require 'spec_helper'

require 'piv_2_pdf/renderer'

describe Piv2Pdf::Renderer, "with a single item" do
  it "should render the story name" do
    item = stub(:story => "The Story Title")

    Piv2Pdf::Renderer.new([item]).render.should =~ /The Story Title/
  end
end
