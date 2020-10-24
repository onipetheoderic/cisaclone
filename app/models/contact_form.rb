class ContactForm < MailForm::Base
  attribute :firstname,      :validate => true
  attribute :lastname,      :validate => true
  attribute :phone,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :subject
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "CISA - Contact Form ",
      :to => ENV['CONTACT_EMAIL'],
      :from => %("#{firstname} - #{lastname}" <#{email}>)
    }
  end
end
