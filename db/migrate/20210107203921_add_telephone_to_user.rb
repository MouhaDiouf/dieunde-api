class AddTelephoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telephone, :string, null: true, index:true, unique: true
  end
end
