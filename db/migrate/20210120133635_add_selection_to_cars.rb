class AddSelectionToCars < ActiveRecord::Migration[6.0]
  def change
    add_column(:produits, :selection, :string, array: true, default: [])
  end
end
