class HomeController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :load_sponsors
  layout 'home'
  # before_action :set_career, only: [:career_details]

  def index
    @programs = Program.where(upcoming: true)
    @programs_upcomings = Program.where(upcoming: true)
    @program_all = Program.all.order('created_at DESC')
  end

  def newsletter_subscribe
    email = params[:email]
  end

  def anonymous_donation
    @response_reference = params[:response_reference]
    @user_email = params[:user_email]
    @program_id = params[:program_id]
    @amount = params[:amount]

    @donation = Donation.new(
      amount: @amount,
      purpose: 'anonymous_payment',
      program_id: @program_id,
      user_id: 1,
      message: 'anonymous_payment',
      response_reference: @response_reference
    )
    @program = Program.find(@program_id)  # campaign_id is the id your looking for
    @raised = @program.raised ? @program.raised : 0
    @updated = @raised.to_f + @amount.to_f

    if @donation.save
      puts "errors during saving" << String(@donation.errors.full_messages)
      Program.update(@program_id, raised: @updated)
       ProgramMailer.with(program: @program).notify_super_admin.deliver_later
      render json: { success: true}
    else
      puts "errors during saving" << String(@donation.errors.full_messages)
      render json: { error: true }
    end
  end

  def about_cisa() end

  def causes
    # @campaign_causes = Campaign.all.order("created_at DESC")
    @campaign_causes = Campaign.where(activated: true, completed: false)
    @programs_upcomings = Program.where(upcoming: true)
    @programs = Program.where(published: true)
    # @campaign_raised
    # #@campaign_total
  end

  def programs
    @programs = Program.where(published: true)
    @programs_upcomings = Program.where(upcoming: true)
  end

  def events() end

  def careers
    @careers = Career.open_jobs
    @programs = Program.where(upcoming: true)
    @programs_upcomings = Program.where(upcoming: true)
    @program_all = Program.all.order('created_at DESC')
  end

  def resources
    @resources = Resource.where(published: true)
    # @resources = ResourcesCustom.where(published: true)
    @programs = Program.where(upcoming: true)
    @programs_upcomings = Program.where(upcoming: true)
    @program_all = Program.all.order('created_at DESC')
  end

  def resource_details
    @resource = Resource.friendly.find(params[:id])
    # @resource = ResourcesCustom.find(params[:id])
  end

  def career_details
    @career = Career.friendly.find(params[:id])
  end

  def blog() end

  def contact_us
    @message = Message.new
  end
  # post request to submit the params in the message
  def create_message

    @first_name = params[:message][:first_name]
    @last_name = params[:message][:last_name]
    @subject = params[:message][:subject]
    @message = params[:message][:message]
    @email = params[:message][:email]
    @phone = params[:message][:phone]
    @messages = Message.new(
      first_name: @first_name,
      last_name: @last_name,
      subject: @subject,
      message: @message,
      read: false
    )
    respond_to do |format|
      if @messages.save
        ContactMailer.with(first_name: @first_name, last_name: @last_name, message: @message, subject: @subject).notify_all_admin.deliver_later

        format.html { redirect_to home_path, notice: 'Message have been submitted to the admin' }
      else
        format.html { render :contact_us}
      end
    end
  end

  def terms_and_conditions
    @terms = TandC.last()
  end

  def privacy_policy
    @policy = PrivacyPolicy.last()
  end

  private

  def set_career
    @career = Career.find(params[:id])
  end

  def load_sponsors
    @sponsors = Sponsor.all
    @slides = SliderContent.all
    @volunteers = Volunteer.all
  end
end
