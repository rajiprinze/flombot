class ApplicationController < ActionController::API
  def handshake
    render plain: params[:challenge]
  end
end
