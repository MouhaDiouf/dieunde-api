class AddInSelectionToCar < ActiveRecord::Migration[6.0]
  def change
    add_column :produits, :inSelection, :boolean, default: false
  end
end
