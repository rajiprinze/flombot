module Flombot
  class Bot < SlackRubyBot::Bot
    command 'who sent this' do |client, data, match|
      sender_id = data["user"]
      sender_info = client.users.find{|id, information_array| id == sender_id}[1].profile
      client.say(text:"hello, #{sender_info.display_name}!", channel: data.channel)
      #Optional Argument in client.say: thread_ts: data.thread_ts || data.ts to reply to thread
    end

    scan /(:taco:)/ do |client, data, match|
      #id of all users that have been tagged
      receivers = data.text.scan(/(?<=<@)\w+(?=>)/)

      sender_id = data.user
      sender = User.find_or_create_by(slack_id: sender_id)

      receivers.each do |receiver_id|
        receiver = User.find_or_create_by(slack_id: receiver_id)
        if receiver.id == sender.id
          client.say(channel:data.channel, text: "Tsk, tsk... nice try #{receiver.slack_name}.")
        else
          #change message to exclude slack_ids
          ShoutOut.create(receiver: receiver, sender: sender, message: data.text)
          client.say(channel:data.channel, text: "#{receiver.slack_name} has received your shoutout!")
        end
      end
    end

  end
end
