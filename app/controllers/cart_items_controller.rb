class CartItemsController < ApplicationController
  def index
    render json: CartItem.all
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

end
