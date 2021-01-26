class AddImagesToProduit < ActiveRecord::Migration[6.0]
  def change
    add_column(:produits, :images, :string)
  end
end
