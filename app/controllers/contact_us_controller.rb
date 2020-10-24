class ContactUsController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  layout "home"

  def index
    @contact = ContactForm.new(params[:contact_form])
    @sponsors = Sponsor.all
  end

  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        @contact = ContactForm.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
