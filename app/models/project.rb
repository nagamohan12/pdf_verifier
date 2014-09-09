class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :test_runs
  has_many :pdf_xml_mappings

  validates_presence_of :organization_id
end
