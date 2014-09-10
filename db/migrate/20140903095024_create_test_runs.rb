class CreateTestRuns < ActiveRecord::Migration
	def change
		create_table :test_runs do |t|
			t.integer :project_id ,null: false
			t.string :status
			t.integer :total
			t.integer :failures
			t.datetime :run_at
			t.timestamps
		end
	end
end
