class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :test_runs

  validates_presence_of :organization_id
end
