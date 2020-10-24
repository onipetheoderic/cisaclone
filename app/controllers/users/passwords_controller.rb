# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
 prepend_before_action :require_no_authentication, only: :cancel
  layout "home"
  def new
    @form =  Account::RecoverPasswordForm.new
  end

  # POST /resource/password
  def create
    @form = Account::RecoverPasswordForm.from_params(params)
    @mailee ="smaple@mail.com"
    Account::RecoverPassword.call(@form) do
      on(:invalid_form) {render :new}

      on(:unknown_recovery_email) do
        flash.now[:emal] = "There is no account linked to the email provided"
        render :new
      end

      on(:password_recovery_started) do |user|
        flash.now[:emal] = "Password recovery email has been sent to #{user.email}"
        @form.email = nil
        render :new
      end
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
