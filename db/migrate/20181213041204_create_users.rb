class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.integer :taco_count, default: 0
      t.timestamps
    end
  end
end
