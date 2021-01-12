class UserMailer < ApplicationMailer
  default from: 'throwawaymou@gmail.com'
  def product_approval(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Produit accepté!')
  end
  def product_creation(product)
    @product = product
    mail(to: ENV['admin_email'], subject: 'Nouveau produit créé')
  end
end
