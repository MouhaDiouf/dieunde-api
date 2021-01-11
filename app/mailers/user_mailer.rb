class UserMailer < ApplicationMailer
  default from: 'throwawaymou@gmail.com'
  def product_approval(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Your product was accepted!')
  end
end
