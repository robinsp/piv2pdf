require 'spec_helper'

require 'piv_2_pdf/renderer'
require 'webrat'

describe Piv2Pdf::Renderer, "with a single item" do
  include Webrat::Matchers

  let(:item) do
    stub(:id => "4321",
         :story => "The Story Title",
         :owner => "The Owner's name",
         :estimate => "5",
         :requested_by => "Requester's name",
         :type => "The type",
         :state => "THe state"
         )
  end

  before do
    @result = Piv2Pdf::Renderer.new([item]).render
  end
  

  [:story, :id, :state, :type, :estimate, :requested_by, :owner].each do |prop_name|
    it "should have ##{prop_name} within a div tag" do
      @result.should have_selector("div.item", :content => item.send(prop_name) )
    end
    
  end
    
end
