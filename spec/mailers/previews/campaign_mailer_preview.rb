# Preview all emails at http://localhost:3000/rails/mailers/campaign_mailer
class CampaignMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/campaign_mailer/notify_admin
  def notify_admin
    CampaignMailerMailer.notify_admin
  end

end
