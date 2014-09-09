class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :test_runs
  has_many :pdf_xml_mappings
  accepts_nested_attributes_for :pdf_xml_mappings, allow_destroy: true

  validates_presence_of :organization_id
end
