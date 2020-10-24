# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "home"
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, if: :requested_from_api?

  # GET /resource/sign_in
  def new
    @form = Account::SignInForm.new
  end

  # POST /resource/sign_in
  def create
    @form = Account::SignInForm.from_params(params)

    Account::SignIn.call(@form) do
      on(:invalid_form) {render :new}
      on(:authentication_failed) do
        flash.now[:alert] = "Invalid username and password combination"
        render :new
      end
      on(:login_success) do |user|
        sign_in(user, scope: :user)
        redirect_to profile_dashboard_path
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
