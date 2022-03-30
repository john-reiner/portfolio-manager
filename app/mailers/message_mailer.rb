class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_created.subject
  #
  def message_created

    @portfolio = params[:portfolio]
    @message = params[:message]
    @email = params[:email]

    mail(
        from: "messages@portfoliomanager.com",
        to: "john.a.reiner@gmail.com", 
        subject: "New Message from your Portfolio contact form"
      )
  end
end
