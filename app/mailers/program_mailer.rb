class ProgramMailer < ApplicationMailer
 default from: "no-reply@cisafrica.org"
	
  	def notify_super_admin
  		@program = params[:program]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: "A program named #{@program.title} was donated to with a sum of #{@program.donation.amount} ")
		end
	end

	def notify_completed
		@program = params[:program]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: "The donation to this campaign named #{@program.title} is completed")
		end
	end
end
