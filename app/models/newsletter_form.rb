class NewsletterForm < MailForm::Base
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "CISA - Contact Form ",
      :to => "ask@cisafrica.org",
      :from => %("#{firstname} - #{lastname}" <#{email}>)
    }
  end
end
