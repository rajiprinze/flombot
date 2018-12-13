class Flombot < SlackRubyBot::Bot
  command 'taco' do |client, data, match|
    client.say(text:'burrito', channel:data.channel)
  end
end

Flombot.run
