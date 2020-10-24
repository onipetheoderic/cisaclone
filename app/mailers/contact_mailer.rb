class ContactMailer < ApplicationMailer

 default from: "no-reply@cisafrica.org"
	
  	def notify_all_admin

  		@first_name = params[:first_name]
  		@last_name = params[:last_name]
  		@full_name = "#{@first_name} #{@last_name}"
  		@subject = params[:subject]
  		@message = params[:message]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: "A Customer/User with the name #{@full_name} made an enquiry")
		end
	end

end