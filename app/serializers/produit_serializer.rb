class ProduitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :nom, :description, :catégorie, :prix, :similaires, :marque, :selection, :année, :kilométrage, :etat,:images, :confirmed?
  belongs_to :user

  def similaires
    if(instance_options[:info])
    Produit.where("catégorie": instance_options[:info][:cat]).where.not("id": instance_options[:info][:id]).where("confirmed": true)
  else
    []
  end
end


end
