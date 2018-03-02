class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @info = order
    mail(to: @info.email, subject: "Order ID #{@info.id} receipt confirmation")
  end
end
