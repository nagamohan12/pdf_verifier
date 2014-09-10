require 'rails_helper'

RSpec.describe "pdf_xml_mappings/index", :type => :view do
  before(:each) do
    assign(:pdf_xml_mappings, [
      PdfXmlMapping.create!(
        :xml_node => "MyText",
        :pdf_text => "MyText",
        :project_id => 1
      ),
      PdfXmlMapping.create!(
        :xml_node => "MyText",
        :pdf_text => "MyText",
        :project_id => 1
      )
    ])
  end

  it "renders a list of pdf_xml_mappings" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
