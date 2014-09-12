class ChangeColumnInReports < ActiveRecord::Migration
  def change
  	rename_column :reports, :is_passed?, :is_passed
  end
end
