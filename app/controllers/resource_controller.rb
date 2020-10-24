class ResourceController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  layout 'home'
  


  def index
    @resources = resource.all
  end
  def new
  	@resource = Resource.new
  end

  def show
  end
end
