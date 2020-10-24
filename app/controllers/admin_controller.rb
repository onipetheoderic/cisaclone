class AdminController < ApplicationController
	layout "home"

	#to create a new user from the console setting the admin attribute to true
# u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password', :admin => true)
# u.save  
#u.save commits it to the database

	def new
		@user = User.new
	end
#This is the post request from the new form
	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user).deliver_now
			redirect_to '/', notice: "Successfully created Admin User"

    	else
			render "new" #it should render the new form
		end 
	end


	private

	def user_params
		params.require(:user).permit(:role, :admin, :firstname, :lastname, :email, :password)
	end
end
 