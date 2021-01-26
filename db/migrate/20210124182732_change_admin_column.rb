class ChangeAdminColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :admin, :isadmin

  end
end
