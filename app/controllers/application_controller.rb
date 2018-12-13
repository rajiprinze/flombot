class ApplicationController < ActionController::API
  def handshake
    render plain: params[:challenge]
  end

  def taco_check
    render plain: '🌮'
  end
end
