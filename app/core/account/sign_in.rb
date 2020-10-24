module Account
  class SignIn < Rectify::Command
    def initialize(form)
      @form = form
      @user ||= User.find_by_email(form.email)
    end

    def call
      return broadcast(:invalid_form) if form.invalid?

      return broadcast(:authentication_failed) if user.nil? || !user.valid_password?(form.password)

      broadcast(:login_success,user)
    end

    private
    attr_reader :form, :user
  end

end
