class UsersController < ApplicationController

def favorites
  @user = User.find(params[:id])
  @favorites = @user.favorite_products
  render json: @favorites
end
def remove_favorite
  @user = User.find(params[:user_id])
  @favorites = @user.favorite_products

  @favorite = Favorite.find_by(user_id: params[:user_id], produit_id: params[:produit_id])
  if @favorite.destroy
    render json: @favorites

  end

end

def get_created_products
    @user = User.find(params[:id])
    @created_products = @user.produits
    render json: @created_products
end



private
def user_arams
  params.permit(:id, :produit_id, :user_id)
end

end
