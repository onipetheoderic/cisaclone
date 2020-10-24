class AccountMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'

  def welcome_email(account)
    @user = account.fullname
  end
end
