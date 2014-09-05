class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :policy_name
      t.text :xml_node
      t.text :reason
      t.integer :test_run_id

      t.timestamps
    end
  end
end
