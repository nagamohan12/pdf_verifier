json.array!(@pdf_xml_mappings) do |pdf_xml_mapping|
  json.extract! pdf_xml_mapping, :id, :xml_node, :pdf_text, :project_id
  json.url pdf_xml_mapping_url(pdf_xml_mapping, format: :json)
end
