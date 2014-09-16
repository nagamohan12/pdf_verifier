class ChangeColumnFirstRunToLastRunInProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :first_run, :last_run
  end
end
