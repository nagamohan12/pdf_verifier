class CreatePdfXmlMappings < ActiveRecord::Migration
  def change
    create_table :pdf_xml_mappings do |t|
      t.text :xml_node
      t.text :pdf_text
      t.integer :project_id

      t.timestamps
    end
  end
end
