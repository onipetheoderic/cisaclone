class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

	protected
		def requested_from_api?
			request.format.json?
		end
	
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:admin]) #we allow the username for the signup page and account_update page
			devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :phone, :firstname, :lastname])

			devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
			devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :lastname, :phone)}

		end
end



#to create a new user from the console setting the admin attribute to true
# u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password', :admin => true)
# u.save  
#u.save commits it to the database