class AddOrganizationIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :organization_id,:integer, null: false
  end
end
