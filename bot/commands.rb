module Flombot
  module Commands
    class Taco < SlackRubyBot::Commands::Base
      # Command: You have to directly @Flombot
      command 'who sent this' do |client, data, match|
        sender_id = data["user"]
        sender_info = client.users.find{|id, information_array| id == sender_id}[1].profile
        client.say(text:"hello, #{sender_info.display_name}!", channel: data.channel)
        #Optional Argument in client.say: thread_ts: data.thread_ts || data.ts to reply to thread
      end

      # Listens to taco
      scan /(:taco:)/ do |client, data, match|
        # byebug
        # Better parsing
        recievers = data.text.scan(/\@\w+/)
        users = recievers.map do |id|
          user = User.find_by(slack_id: id[1..-1])
          if user
            user.count +=1
            user.save
          else
            information = client.users.find{|slack_id, information| id[1..-1] == slack_id}[1].profile
            user = User.create(
              slack_id: id[1..-1],
              name: information.display_name,
            )
          end
          user
        end
        user_names = users.map { |user| "<@#{user.slack_id}>"  }
        user_shoutouts = users.map { |user| user.count  }
        client.say(channel:data.channel, text: "#{user_names.join(', ')} has received your shoutouts! #{user_shoutouts.join(', ')}")
      end
    end
  end
end
