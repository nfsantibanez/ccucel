class ChangeUsersColumnsNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :occupation, :jobtitle
    rename_column :users, :enterprice, :company
    rename_column :users, :cost_center, :deptname
    rename_column :users, :job_center, :business_unit
  end
end
