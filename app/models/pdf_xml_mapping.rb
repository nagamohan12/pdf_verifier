class PdfXmlMapping < ActiveRecord::Base
	belongs_to :project
	accepts_nested_attributes_for :project, allow_destroy: true
end
