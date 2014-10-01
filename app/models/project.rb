class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :test_runs
  has_many :pdf_xml_mappings
  has_many :reports , through: :test_runs
  has_one :last_test_run, -> { run_at_desc }, class_name: "TestRun"
  #has_many :last_runs, -> { last_run_at }, class_name: 'TestRun'
 
  accepts_nested_attributes_for :pdf_xml_mappings, allow_destroy: true

  validates_presence_of :organization_id,:name,:pdf_folder,:input_folder
  validates_uniqueness_of :name, scope: :organization_id
end
