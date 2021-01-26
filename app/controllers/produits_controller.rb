class ProduitsController < ApplicationController
  def index
    render json: Produit.all.where('confirmed': true)
end

def admin_index
  render json: Produit.all
end
def create
  @produit = Produit.new(product_params)

  if @produit.save
    UserMailer.product_creation(@produit).deliver
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
@product_cat = @product.catégorie
if @product
render json: @product , info: {cat: @product_cat, id: params[:id]}
else

  render json: {
    status: 500,
    errors: @product.errors.full_messages
  }
end
end

def update
  @product = Produit.find(params[:id])
  @product.update(product_params)
  @product.confirmed = false

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

def validate_product
  @product = Produit.find(params[:id])
  @product.confirmed = !@product.confirmed
  @product_user = @product.user
  if @product.save
    if @product.confirmed
    UserMailer.product_approval(@product_user, @product).deliver

  end
    render json: {
      status: 'validation updated'
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

def upload_image
        image = Cloudinary::Uploader.upload(params[:image])
        render json: image
end


def delete_image
  result = Cloudinary::Uploader.destroy(params[:public_id])
  render json: result
end

def add_to_selection
  @produit = Produit.find(params[:id])
  @produit.inSelection = true
  render json: {
    status: 'added'
  }
end

def remove_from_selection
  @produit = Produit.find(params[:id])
  @produit.inSelection = false
  render json: {
    status: 'removed from selection'
  }
end

private
def product_params
  params.permit(:nom, :description, :prix, :catégorie, :user_id,  :produit_id, :id, :marque, :public_id, :images, :kilométrage, :année, :etat)
end

end
