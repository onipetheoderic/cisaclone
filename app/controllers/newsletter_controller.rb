class NewsletterController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  layout "home"

  def index
    @newsletter = NewsletterForm.new(params[:newsletter_form])
  end

  def create
    @newsletter = NewsletterForm.new(params[:newsletter_form])
    @newsletter.request = request
    respond_to do |format|
      if @newsletter.deliver
        @newsletter = NewsletterForm.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
