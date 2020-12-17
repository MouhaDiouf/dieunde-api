class ProduitsController < ApplicationController
  def index
    render json: Produit.all
  end
end
