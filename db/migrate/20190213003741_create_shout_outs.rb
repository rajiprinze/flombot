class CreateShoutOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :shout_outs do |t|
      t.text :message
      t.integer :sender_id
      t.integer :receiver_id 
      t.timestamps
    end
  end
end
