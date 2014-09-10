require 'rails_helper'

RSpec.describe "pdf_xml_mappings/show", :type => :view do
  before(:each) do
    @pdf_xml_mapping = assign(:pdf_xml_mapping, PdfXmlMapping.create!(
      :xml_node => "MyText",
      :pdf_text => "MyText",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
