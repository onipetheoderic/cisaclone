module Account
  class SignUp < Rectify::Command

    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid_form) if form.invalid?

      transaction do
        create_account
        send_welcome_email
      end
      broadcast(:account_creation_success,account)

      rescue ActiveRecord::RecordNotUnique
        broadcast(:race_non_unique_email)
    end

    private
    attr_reader :form, :account

    def create_account
      @account ||= User.create!(form.attributes)
    end

    def send_welcome_email
      AccountMailer.welcome_email(@account).deliver_now
    end
  end

end
