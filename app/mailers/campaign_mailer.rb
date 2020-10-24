class CampaignMailer < ApplicationMailer
  # default from: "notification@cisafrica.org"
  default from: "no-reply@cisafrica.org"

	# def notify_admin(campaign,admin_email)
	# 	@campaign = params[:campaign]
	# 	mail to: admin_email, subject: "New campaign request #{@campaign.name}"
	# end

	def notify_user
		@campaign = params[:campaign]
		puts "Email sent" << String(@campaign)
		mail(to: @campaign.user.email, subject: 'You campaign named #{@campaign.name} was successfully created')
		
	end

  	def notify_super_admin
  		@campaign = params[:campaign]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: 'A campaign named #{@campaign.title} Was created by #{campaign.user.fullname}, You Verification is Needed before the Campaign Can go Live')
		end
	end

	def successfull_verification_notification
		@campaign = params[:campaign]
		puts "Email sent" << String(@campaign)
    	mail(to: @campaign.user.email, subject: 'You campaign named #{@campaign.name} is Now Live')
	end

	 def super_admin_successfull_verification
  		@campaign = params[:campaign]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: 'The campaign named #{@campaign.name} has been successfully verified and Is now Live')
		end
	end

	def notify_user_update
		@campaign = params[:campaign]
		puts "Email sent" << String(@campaign)
    	mail(to: @campaign.user.email, subject: 'You campaign named #{@campaign.name} is successfully updated')
	end

	def notify_super_admin_update
		@campaign = params[:campaign]
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: 'The campaign named #{@campaign.name} has just been modified, please Review')
		end
	end
# CampaignMailer.with(name: self.name, raised: self.raised, goal: self.goal)
	def notify_user_completed
		@fullname = params[:fullname]
		@email = params[:email]
		@name = params[:name]
		@raised = params[:raised]
		@goal = params[:goal]
		puts "Email sent" << String(@email)
    	mail(to: @email, subject: 'Congrats Your Campaign goal has been completed')		
	end

	def notify_admin_completed
		@fullname = params[:fullname]
		@email = params[:email]
		@name = params[:name]
		@raised = params[:raised]
		@goal = params[:goal]
		puts "Email sent" << String(@email)
    	User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: 'The campaign named #{@campaign.name} goals is fulfilled and completed')
		end
	end
 
end

