class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :slack_id
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
