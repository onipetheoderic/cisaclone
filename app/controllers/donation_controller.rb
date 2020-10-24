class DonationController < ApplicationController
  before_action :authenticate_user!
   before_action :set_campaign_slug, only: [:campaign_show]
   protect_from_forgery with: :null_session, only: [:create]
   skip_before_action :verify_authenticity_token, only: [:create]
  layout "home"  

  def index
  end

  def show
  end

  def campaign_show
    @donation = Donation.new
  end



  def new
     @donation = current_user.donations.build
  end

  def edit
  end

  def update
  end
 
  
#   def paystackUrl
#     @random = SecureRandom.hex(14)
#     paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
#     transactions = PaystackTransactions.new(paystackObj)
#     result = transactions.initializeTransaction(
#     :reference => @random, #must be unique for every transaction created if not you will get a bad request error
#     :amount => 40000,
#     :email => "onipetheoderic@gmail.com",
#     )
#   auth_url = result['data']['authorization_url']
# redirect_to auth_url
#   end

  def create
    @response_reference= params[:response_reference]
    @user_id = params[:user_id]
    @user_email = params[:user_email]
    @program_id = params[:campaign_id]  
    @amount = params[:amount]
   @donation_purpose = params[:purpose]
    @message = params[:message]
    @donation = Donation.new(
      :amount => @amount,
      :purpose => @donation_purpose,
      :program_id => @program_id,
      :user_id => @user_id,
      :message => @message,
      :response_reference => @response_reference
      )
puts "errors during saving" << String(@donation.errors.full_messages)
@user = current_user
    @program = Program.find(@program_id)  # campaign_id is the id your looking for
    @raised = @program.raised ? @program.raised : 0
    @updated = @raised.to_f + @amount.to_f
    if @donation.save 
        puts "errors during saving" << String(@donation.errors.full_messages)
      Program.update(@program_id, raised: @updated)
      # ProgramMailer.with(program: @program,).notify_super_admin.deliver_later
      DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name, program: @program ).notify_donator.deliver_later
      DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name, program: @program ).notify_super_admin.deliver_later
      render json: { success: true, user_fullname: current_user.fullname}
    else
     puts "errors during saving" << String(@donation.errors.full_messages)
      render json: { error: true }
      end
    end 
 

  def destroy
  end

private
    
    def set_campaign_slug
      @campaign_show = Campaign.find_by_slug!(params[:id])
    end

    def donation_params
      params.require(:donation).permit(:amount, :campaign_id, :message, :purpose, :user_id)
    end

    def donations
      params.permit(:amount, :campaign_id, :message, :purpose, :user_id)
    end
end


 # def create
 #    @response_reference= params[:response_reference]
 #    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
 #    transactions = PaystackTransactions.new(paystackObj)
 # #    @result = transactions.verify(@response_reference)
 
 # # if @result.data.status = true

 #    @user_id = params[:user_id]
 #    @user_email = params[:user_email]
 #    @parsed_float = params[:parsed_float]
    
 #    puts "this is the response_reference" << String(@response_reference)
   
 #    @admin_user = User.where(admin: true)[0]
 #    @super_admin_email = @admin_user.email
 #    # @donation = Donation.new(donation_params)
    

 #    # @campaign_id = params[:donation][:campaign_id] #to get the id of the campaign
 #    @campaign_id = params[:campaign_id]
 #    #@amount = params[:donation][:amount] #to get the amount of the campaign
 #    @amount = params[:amount]

 #   # @donation_purpose = params[:donation][:purpose]
 #   @donation_purpose = params[:purpose]
 #    #@message = params[:donation][:message]
 #    @message = params[:message]
 #    @donation = Donation.new(
 #      :amount => @amount,
 #      :purpose => @donation_purpose,
 #      :campaign_id => @campaign_id,
 #      :user_id => current_user.id,
 #      :message => @message
 #      )
 #    @user = current_user 
 #    @campaign_raised = Campaign.find(@campaign_id)  # campaign_id is the id your looking for
 #    @campaign_name = @campaign_raised.name
 #    @campaign_story = @campaign_raised.story
 #    @campaign_admin_email = @campaign_raised.user.email
 #    @campaign_admin_name = @campaign_raised.user.fullname
 #    #if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
 #    @raised = @campaign_raised.raised ? @campaign_raised.raised : 0
 #    @updated = @raised.to_f + @amount.to_f
 #    puts "Campaign raised" << String(@updated)
 #    puts "Donation Instanceeee" << String(@donation)
         
 #    if @donation.save   
   
 #     Campaign.update(@campaign_id, raised: @updated)
 #     DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, campaign_name: @campaign_name, campaign_story: @campaign_story, campaign_admin_email: @campaign_admin_email, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name ).notify_donator.deliver_later
 #     DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, campaign_name: @campaign_name, campaign_story: @campaign_story, campaign_admin_email: @campaign_admin_email, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name ).notify_admin.deliver_later
 #     DonationMailer.with(user: @user, amount: @amount, message: @message, donation_purpose: @donation_purpose, campaign_name: @campaign_name, campaign_story: @campaign_story, campaign_admin_email: @campaign_admin_email, current_realized: @updated, super_admin_email: @super_admin_email, campaign_admin_name: @campaign_admin_name ).notify_super_admin.deliver_later

 #      render json: { success: "Thanks for your generous donation", user_fullname: @user.fullname}
 #      else
 #      #render "new" 
 #       #render :json => {:error => true }
 #       render json: { error: true }
 #      end
 #    end 
 
