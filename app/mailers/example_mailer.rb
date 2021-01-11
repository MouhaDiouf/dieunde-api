class ExampleMailer < ApplicationMailer
  default from: "throwawaymou@gmail.com"
  def sample_email(user)
   @user = user
   mail(to: @user.email, subject: 'Product confirmation Email')
 end
end
