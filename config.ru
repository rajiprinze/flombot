# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require ::File.expand_path('../config/environment', __FILE__)
require ::File.expand_path('../app/models/bot', __FILE__)


Thread.abort_on_exception = true

Thread.new do
  Flombot::Bot.run
end

run Rails.application
