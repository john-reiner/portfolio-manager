class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_created.subject
  #
  def message_created
    
    
    @message = params[:message]
    # @message = Message.last

    mail(
        from: "noreply@manager-herokuapp.com",
        to: "john.a.reiner@gmail.com", 
        subject: "New Message from your Portfolio contact form"
      )
  end
end