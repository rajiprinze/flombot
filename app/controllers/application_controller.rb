class ApplicationController < ActionController::API
  
  def taco_check
    render plain: '🌮'
  end
end
