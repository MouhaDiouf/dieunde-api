class ProduitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :nom, :description, :catégorie, :prix, :image, :similaires
  belongs_to :user

  def similaires
    if(instance_options[:info])
    Produit.where("catégorie": instance_options[:info][:cat]).where.not("id": instance_options[:info][:id])
  else
    []
  end
end
  def image
   if object.image.attached?
     {
       url: rails_blob_url(object.image)
     }
   end
 end


end
