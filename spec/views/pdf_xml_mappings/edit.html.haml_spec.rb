require 'rails_helper'

RSpec.describe "pdf_xml_mappings/edit", :type => :view do
  before(:each) do
    @pdf_xml_mapping = assign(:pdf_xml_mapping, PdfXmlMapping.create!(
      :xml_node => "MyText",
      :pdf_text => "MyText",
      :project_id => 1
    ))
  end

  it "renders the edit pdf_xml_mapping form" do
    render

    assert_select "form[action=?][method=?]", pdf_xml_mapping_path(@pdf_xml_mapping), "post" do

      assert_select "textarea#pdf_xml_mapping_xml_node[name=?]", "pdf_xml_mapping[xml_node]"

      assert_select "textarea#pdf_xml_mapping_pdf_text[name=?]", "pdf_xml_mapping[pdf_text]"

      assert_select "input#pdf_xml_mapping_project_id[name=?]", "pdf_xml_mapping[project_id]"
    end
  end
end
