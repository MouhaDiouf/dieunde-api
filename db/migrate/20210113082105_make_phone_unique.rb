class MakePhoneUnique < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :telephone, :string, unique: true, null: false)
  end
end
