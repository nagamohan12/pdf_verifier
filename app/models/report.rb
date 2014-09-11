class Report < ActiveRecord::Base
	belongs_to :test_run
	scope :passed, -> { where(is_passed?: true).order('id')}
	scope :failure, -> { where(is_passed?: false).order('id')}
end
