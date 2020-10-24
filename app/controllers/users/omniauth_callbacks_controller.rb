# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout "home"
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
      logger.info "facebok method was called"
     @user = User.create_from_provider_data(request.env['omniauth.auth'])
     if @user.persisted?
       sign_in_and_redirect @user
       set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
     else
       flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
       redirect_to new_user_registration_url
     end
  end

  def failure
    logger.debug "Request env  attributes hash: #{request.env['omniauth.auth']}"
    flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
