class TestRun < ActiveRecord::Base
	has_many :reports
	belongs_to :project
	validates_presence_of :project_id
	scope :last_run_at, -> { order(run_at: :desc).first}
	scope :run_at_desc, -> { order(run_at: :desc)}

	def success
		self.processed.to_i - self.failed.to_i
	end

	def failed
		self.failures.to_i
	end

	def processed
		self.total.to_i
	end
end
