module Flombot
  module Commands
    class Taco < SlackRubyBot::Commands::Base
      command ':taco:' do |client, data, _match|
        client.say(text:'burrito', channel:data.channel)
      end
    end
  end
end
