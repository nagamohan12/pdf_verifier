class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :pdf_name
      t.string :xml_node
      t.string :reason
      t.integer :test_run_id
      t.boolean :is_passed?

      t.timestamps
    end
  end
end
