class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :public_goal
      t.string :private_goal

      t.timestamps
    end
    add_index :goals, :user_id
    add_index :goals, :public_goal
    add_index :goals, :private_goal
  end
end
