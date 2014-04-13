class EnquiryMailer < ActionMailer::Base
  default from: "The Coder Factory <peter.argent@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.received.subject
  #
  def received(enquiry)
    @enquiry = enquiry
    mail(to: enquiry.email, subject: "Your enquiry has been received.")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.response.subject
  #
  def response(enquiry)
    @enquiry = enquiry
    mail(to: "peter.argent@gmail.com", subject: "An enquiry has been received")
  end
end
