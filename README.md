Potential Goals:

* Store the original text (full message)
  * User responsable for thier own count
    - Taco limit column? 
    - no SELF-TACO
  * Join between users for shoutouts 
    - save original message (message_text) ?
  * Recipient, sender
  * Original thread id?

* Multiple users (Potential Issue?)
* Better Documentation (SST: https://github.com/slack-ruby/slack-ruby-bot)
  * Write better documents


  Based on most of the SlackBotRuby documentation, it seemed that you could just write a few commands and have something run. However, anytime we need the Bot to run, we would have to run the file with the command `Bot.Run`

  I started by reading up on SlackBotRuby and found that the main point of the gem is to integrate the Slack Real Time Messaging API.

  ### Read these tutorials:
   - https://github.com/slack-ruby/slack-ruby-bot/blob/master/TUTORIAL.md
   - https://github.com/dblock/slack-bot-on-rails

  ### config.ru
  The main difference in the app when running a with a server was some piece of code in the config.ru file. This is what I added to the rails app

  ```
  require_relative 'config/environment'
  require ::File.expand_path('../config/environment', __FILE__)
  require ::File.expand_path('../bot/flombot', __FILE__)
  require ::File.expand_path('../bot/commands', __FILE__)

  Thread.abort_on_exception = true

  Thread.new do
    Flombot::Bot.run
  end

  run Rails.application
  ```


  ### Gemfile
  Needs a few gems:
   - gem 'dotenv-rails', groups: [:development, :test]
   - gem 'slack-ruby-bot'
   - gem 'celluloid-io'

  ### .env (still super secret)
  SLACK_API_TOKEN=(INSERT TOKEN HERE)

  ### flombot/bot folder
  The /bot folder now contains two files, commands.rb and flombot.rb

  commands.rb
  ```
  module Flombot
    module Commands
      class Taco < SlackRubyBot::Commands::Base
        command 'taco' do |client, data, _match|
          client.say(text:'burrito', channel:data.channel)
        end
      end
    end
  end
  ```


  flombot.rb
  ```
  module Flombot
    class Bot < SlackRubyBot::Bot
    end
  end
  ```

  Basically, Flombot is now a module that has a class of Bot and a Module of Commands. Anytime you run rails s, the Bot starts listening and responding to commands :)
