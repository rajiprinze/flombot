class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :slack_id
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
