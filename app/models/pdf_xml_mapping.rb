class PdfXmlMapping < ActiveRecord::Base
	belongs_to :project

	validates_presence_of :xml_node
	validates_presence_of :pdf_text
end
