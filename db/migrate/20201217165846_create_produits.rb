class CreateProduits < ActiveRecord::Migration[6.0]
  def change
    create_table :produits do |t|
      t.string  :nom
      t.text :description
      t.integer :prix
      t.string :categorie
      t.timestamps
    end
  end
end
