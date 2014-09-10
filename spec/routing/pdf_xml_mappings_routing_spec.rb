require "rails_helper"

RSpec.describe PdfXmlMappingsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pdf_xml_mappings").to route_to("pdf_xml_mappings#index")
    end

    it "routes to #new" do
      expect(:get => "/pdf_xml_mappings/new").to route_to("pdf_xml_mappings#new")
    end

    it "routes to #show" do
      expect(:get => "/pdf_xml_mappings/1").to route_to("pdf_xml_mappings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pdf_xml_mappings/1/edit").to route_to("pdf_xml_mappings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pdf_xml_mappings").to route_to("pdf_xml_mappings#create")
    end

    it "routes to #update" do
      expect(:put => "/pdf_xml_mappings/1").to route_to("pdf_xml_mappings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pdf_xml_mappings/1").to route_to("pdf_xml_mappings#destroy", :id => "1")
    end

  end
end
