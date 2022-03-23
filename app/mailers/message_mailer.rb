class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_created.subject
  #
  def message_created
    @greeting = "Hi #{Portfolio.first.email}"
    # @portfolio = params[:portfolio]
    # @message = params[:message]

    mail(
        from: "messages@portfoliomanager.com",
        to: Portfolio.first.email, 
        subject: "New Message from your Portfolio contact form"
      ) 
  end
end
