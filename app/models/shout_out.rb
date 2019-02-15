class ShoutOut < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validate :disallow_self_shout_out

  def disallow_self_shout_out
    if sender_id == receiver_id
      errors.add(:receiver_id, 'cannot refer back to the sender')
    end
  end
end
