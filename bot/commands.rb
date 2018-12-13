module Flombot
  module Commands
    class Taco < SlackRubyBot::Commands::Base
      command 'who sent this' do |client, data, _match|
        sender_id = data["user"]
        sender_info = client.users.find{|id, information_array| id == sender_id}[1].profile
        client.say(text:"hello, #{sender_info.display_name}!", channel:data.channel)
      end

      match /^Taco to (?<receiver>\w*)$/ do |client, data, _match|
        user = User.find_or_create_by(name: _match[:receiver])
        user.count += 1
        user.save
        client.say(channel:data.channel, text: "#{user.name} has #{user.count} shoutouts!")
      end
    end
  end
end
