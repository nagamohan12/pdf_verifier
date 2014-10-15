class CreateFileConfigurations < ActiveRecord::Migration
  def change
    create_table :file_configurations do |t|
      t.string :key
      t.string :value
      t.timestamps
    end
  end
end
