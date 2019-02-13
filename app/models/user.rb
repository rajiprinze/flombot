class User < ApplicationRecord
    has_many :shout_outs_received, foreign_key: :receiver_id, class_name: "ShoutOut"
    has_many :shout_outs_sent, foreign_key: :sender_id, class_name: "ShoutOut"

    #return string version of slack_id
    def slack_name
        "<@#{self.slack_id}>"
    end
end
