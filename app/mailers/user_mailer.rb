class UserMailer < ApplicationMailer
	def welcome_email(user)
    	@user = user
    	mail(to: @user.email, subject: 'Welcome #{@campaign.fullname} to CISA')
  	end
end
