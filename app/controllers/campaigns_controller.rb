class CampaignsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_campaign, only: [:update, :destroy]
   before_action :set_campaign_slug, only: [:show, :edit, :update, :destroy]
  layout "profile"

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.where(activated: true, completed: false)
    # @campaign_goal=
    # @campaign_count
  end
#amount donated = Goal - amount_raised
  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
  # @campaign = Campaign.new
   @campaign = current_user.campaigns.build
   # @campaign = Campaigns::Form.new
  end

  # GET /campaigns/1/edit
  def edit
  end


  def create
    @campaign = current_user.campaigns.build(campaign_params)
    @user = current_user
    # @campaign = Campaign.new(campaign_params)
    respond_to do |format|
      if @campaign.save
        # CampaignMailer.notify_user(@campaign).deliver_now  
          CampaignMailer.with(campaign: @campaign).notify_user.deliver_later
          CampaignMailer.with(campaign: @campaign).notify_super_admin.deliver_later        
          format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
          format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        CampaignMailer.with(campaign: @campaign).notify_user_update.deliver_later
        CampaignMailer.with(campaign: @campaign).notify_super_admin_update.deliver_later
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def non_activated_campaign
    @campaigns = Campaign.where(:activated => false)
  end
  def activated_campaign
    @campaigns = Campaign.where(:activated => true)
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def set_campaign_slug
      @campaign = Campaign.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:campaign_category_id, :image, :activated, :user_id, :name, :story, :facebooK_shares, :twitter_shares, :likes, :goal)
    end


end
