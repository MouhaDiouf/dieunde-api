class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']
  def product_approval(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Produit accepté')
  end
  def product_creation(product)
    @product = product
    mail(to: ENV['admin_email'], subject: 'Nouveau produit créé')
  end
end
