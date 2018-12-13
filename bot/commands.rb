module Flombot
  module Commands
    class Taco < SlackRubyBot::Commands::Base
      command 'who sent this' do |client, data, match|
        sender_id = data["user"]
        sender_info = client.users.find{|id, information_array| id == sender_id}[1].profile
        client.say(text:"hello, #{sender_info.display_name}!", channel:data.channel)
      end

      scan /(:taco:)/ do |client, data, match|
        recievers = data.text.scan(/\@\w+/)
        users = recievers.map do |id|
          user = User.find_by(slack_id: id[1..-1])
          if user
            user.count +=1
            user.save
          else
            information = client.users.find{|s_id, information| id[1..-1] == s_id}[1].profile
            user = User.create(
              slack_id: id[1..-1],
              name: information.display_name,
            )
          end
          user
        end
        user_names = users.map { |user| user.name  }
        user_shoutouts = users.map { |user| user.count  }
        client.say(channel:data.channel, text: "#{user_names.join(', ')} has recieved your shoutouts! #{user_shoutouts.join(', ')}")
      end
    end
  end
end
