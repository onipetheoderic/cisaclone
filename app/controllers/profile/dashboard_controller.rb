class Profile::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:mark_as_read, :mark_as_unread, :message_show]
  layout "member"


  def index
  	@campaign_category = CampaignCategory.all.order("created_at DESC")
  	@campaign_category_count = CampaignCategory.count
    @donations = current_user.donations.order('created_at DESC')
    @campaigns = current_user.campaigns.order('created_at DESC')
  	@campaign_count = Campaign.count
    @personal_campaign_count = current_user.campaigns.count
    @all_campaigns = Campaign.order('created_at DESC').limit(5) # n= number
  	@user_count = User.count

    @unread_msg = Message.where(:read => false).count
    @read_msg = Message.where(:read => true).count

    @post_count = Post.count
    @careers_count = Career.count
  	@not_yet_activated_campaign_count = Campaign.where(:activated => false).count
  	@activated_campaign_count = Campaign.where(:activated => true).count

    @programs = Program.count
    @programs_published = Program.where(:published => true).count
    @programs_drafted = Program.where(:published => false).count
    @programs_upcoming = Program.where(:upcoming => true).count

    @resource = ResourcesCustom.count
    @resources_all = ResourcesCustom.all.order("created_at DESC")

  end

  def all_read
    @read_msgs = Message.where(:read => true)
  end

  def all_unread
    @unread_msgs = Message.where(:read => false)
  end

  def mark_as_read

  end

  def mark_as_unread

  end

  def message_show
    @message_id = params[:id]#this is a get request, so we extract the params from the url
    puts @message_id
    Message.update(@message_id, read: true)
  end



  private
   def set_message
      @message = Message.find(params[:id])
    end
end
