module Account
  class RecoverPassword < Rectify::Command

    def initialize(form)
      @form ,@email = form, form.email
      @user ||= User.find_by_email(form.email)
    end

    def call
      return broadcast(:invalid_form) if form.invalid?
      return broadcast(:unknown_recovery_email,email) if user.nil?
      transaction do
        user.send_reset_password_instructions
        broadcast(:password_recovery_started, user)
      end

    end

    private
    attr_reader :form, :user, :email

  end

end
