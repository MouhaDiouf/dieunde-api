class AddConfirmationToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :produits, :confirmed, :boolean, default: :false
  end
end
