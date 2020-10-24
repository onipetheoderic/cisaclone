class ProgramsController < ApplicationController
  # before_action :set_program, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:check_login_status]
   before_action :set_program_slug, only: [:show, :edit, :update, :destroy]
   layout "home"

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.where(completed: false)
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
  end

  # GET /programs/new
  def new
    @program = current_user.programs.build
  end

  # GET /programs/1/edit
  def edit
  end


  # POST /programs
  # POST /programs.json

  def create
    @program = current_user.programs.build(program_params)
    @user = current_user
    # @campaign = Campaign.new(campaign_params)
    respond_to do |format|
      if @program.save
          ProgramMailer.with(program: @program).notify_super_admin.deliver_later        
          format.html { redirect_to @program, notice: 'Program was successfully created.' }
          format.json { render :show, status: :created, location: @program}
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
end
  

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  #Using methods from the previous campaign mailer
 def update
    respond_to do |format|
      if @program.update(program_params)
        CampaignMailer.with(campaign: @program).notify_user_update.deliver_later
        CampaignMailer.with(campaign: @program).notify_super_admin_update.deliver_later
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    def set_program_slug
      @program = Program.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:title, :user_id, :short_description, :description, :location, :image, :starts_at, :ends_at, :published, :active, :upcoming, :goal, )
    end
end
