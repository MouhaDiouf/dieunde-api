class ProduitsController < ApplicationController
  def index
    render json: Produit.all
  end

def create
  @produit = Produit.new(product_params)
  if @produit.save
    render json: {
      status: 'created',
      produit: @produit
    }
  else
    render json: {
      status: 500,
      errors: @produit.errors.messages,
    }
  end
end

def show
@product = Produit.find(params[:id])
if @product
render json: Produit.find(params[:id])
else
  render json: {
    status: 500,
    errors: @product.error.full_messages
  }
end
end

private
def product_params
  params.permit(:nom, :description, :prix, :catégorie, :user_id, :image)
end

end
