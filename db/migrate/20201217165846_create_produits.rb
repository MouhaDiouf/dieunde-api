class CreateProduits < ActiveRecord::Migration[6.0]
  def change
    create_table :produits do |t|
      t.string  :nom
      t.text :description
      t.integer :prix
      t.string :catégorie
      t.integer :user_id
      t.boolean :valide, default: :true
      t.timestamps
    end
  end
end
