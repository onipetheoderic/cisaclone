class DonationMailer < ApplicationMailer
	default from: "no-reply@cisafrica.org"

	def notify_donator
		@user = params[:user]
		@program = params[:program]
		@admin_email = params[:campaign_admin_email]
		@purpose = params[:donation_purpose]
		@amount= params[:amount]
		@message = params[:message]
		@donation_purpose = params[:donation_purpose]
		@current_realized = params[:current_realized]
		@super_admin_email = params[:super_admin_email]
		puts "Email sent" << String(@user.email)
		mail(to: @user.email, subject: "You donated #{@amount} money to the #{@program.title} in CISA")
	end

	def notify_admin
		@user = params[:user]
		@admin_email = params[:campaign_admin_email]
		@admin_name = params[:campaign_admin_name]
		@purpose = params[:donation_purpose]
		@amount= params[:amount]
		@message = params[:message]
		@donation_purpose = params[:donation_purpose]
		
		@current_realized = params[:current_realized]
		@super_admin_email = params[:super_admin_email]
		puts "Email sent" << String(@admin_email)
		mail(to: @admin_email, subject: "A sum of #{@amount} Was donated to your Campaign in CISA named #{campaign_name}")
	end

	def notify_super_admin
		@user = params[:user]
		@admin_email = params[:campaign_admin_email]
		@purpose = params[:donation_purpose]
		@amount= params[:amount]
		@program = params[:program]
		@message = params[:message]
		@donation_purpose = params[:donation_purpose]
		@current_realized = params[:current_realized]
		@super_admin_email = params[:super_admin_email]
		puts "Email sent" << String(@super_admin_email)
		
		User.where(admin: true).pluck(:email).each do |email|
  			mail(to: email,  subject: "A sum of #{@amount} Was donated to the campaign named #{@program.title}")
		end
	end
end
