class ResourcesCustomsController < ApplicationController
  before_action :set_resources_custom, only: [:show, :edit, :update, :destroy]

  # GET /resources_customs
  # GET /resources_customs.json
  def index
    @resources_customs = ResourcesCustom.all
  end

  # GET /resources_customs/1
  # GET /resources_customs/1.json
  def show
  end

  # GET /resources_customs/new
  def new
    @resources_custom = ResourcesCustom.new
  end

  # GET /resources_customs/1/edit
  def edit
  end

  # POST /resources_customs
  # POST /resources_customs.json
  def create
    @resources_custom = ResourcesCustom.new(resources_custom_params)

    respond_to do |format|
      if @resources_custom.save
        format.html { redirect_to @resources_custom, notice: 'Resources custom was successfully created.' }
        format.json { render :show, status: :created, location: @resources_custom }
      else
        format.html { render :new }
        format.json { render json: @resources_custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources_customs/1
  # PATCH/PUT /resources_customs/1.json
  def update
    respond_to do |format|
      if @resources_custom.update(resources_custom_params)
        format.html { redirect_to @resources_custom, notice: 'Resources custom was successfully updated.' }
        format.json { render :show, status: :ok, location: @resources_custom }
      else
        format.html { render :edit }
        format.json { render json: @resources_custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources_customs/1
  # DELETE /resources_customs/1.json
  def destroy
    @resources_custom.destroy
    respond_to do |format|
      format.html { redirect_to resources_customs_url, notice: 'Resources custom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resources_custom
      @resources_custom = ResourcesCustom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resources_custom_params
      params.require(:resources_custom).permit(:title, :description, :published)
    end
end
