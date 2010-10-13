require 'spec_helper'

require 'piv_2_pdf/renderer'
require 'webrat'

describe Piv2Pdf::Renderer, "with a single item" do
  include Webrat::Matchers

  let(:item) do
    stub(:id => "4321",
         :story => "The Story Title",
         :owned_by => "The Owner's name",
         :estimate => "5",
         :requested_by => "Requester's name",
         :story_type => "The type",
         :current_state => "THe state"
         )
  end

  before do
    @result = Piv2Pdf::Renderer.new([item]).render
  end
  

  [:story, :id, :current_state, :story_type, :estimate, :requested_by, :owned_by].each do |prop_name|
    it "should have ##{prop_name} within a div tag" do
      @result.should have_selector("div.item", :content => item.send(prop_name) )
    end
    
  end
    
end
