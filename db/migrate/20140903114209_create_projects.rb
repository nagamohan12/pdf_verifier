class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :organization_id, null: false
      t.string :name
      t.text :description
      t.string :input_folder
      t.string :output_folder
      t.string :run_frequency
      t.datetime :run_at

      t.timestamps
    end
  end
end