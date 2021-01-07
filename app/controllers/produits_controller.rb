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

def update
  @product = Produit.find(params[:id])
  @product.update(product_params)
  if @product.save
    render json: {
      status: 'updated'
    }
  else
    render json: {
      status: 500,
      errors: @product.error.full_messages
    }
  end
end
def create_liker
@product = Produit.find(params[:produit_id])
@user = User.find(params[:user_id])
@new_favorite = Favorite.create(user_id: params[:user_id], produit_id: params[:produit_id])
@user_favorites = @user.favorite_products
if @new_favorite.save
  render json: @user_favorites

else
render json: {
  status: 500,
  errors: @new_favorite.error.full_messages
}
end

end

def destroy
  @product = Produit.find(params[:id])

  if @product.destroy
    render json: {
      status: "destroyed",

    }
  end
end

private
def product_params
  params.permit(:nom, :description, :prix, :catégorie, :user_id, :image, :produit_id, :id)
end

end
