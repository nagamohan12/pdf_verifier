require 'rails_helper'

RSpec.describe "PdfXmlMappings", :type => :request do
  describe "GET /pdf_xml_mappings" do
    it "works! (now write some real specs)" do
      get pdf_xml_mappings_path
      expect(response.status).to be(200)
    end
  end
end
