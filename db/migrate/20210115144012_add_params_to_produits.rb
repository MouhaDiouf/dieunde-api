class AddParamsToProduits < ActiveRecord::Migration[6.0]
  def change
    add_column(:produits, :marque, :string, null: false )
    add_column(:produits, :année, :string)
    add_column(:produits, :kilométrage, :string)
    add_column(:produits, :etat, :string, default: "occasion")
  end
end
