class ProduitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :nom, :description, :catégorie, :prix, :image, :similaires
  belongs_to :user

  def similaires
    Produit.where(" produits.nom LIKE 'smartphones' OR produits.catégorie LIKE 'smartphones'" )
  end
  def image
   if object.image.attached?
     {
       url: rails_blob_url(object.image)
     }
   end
 end



end
