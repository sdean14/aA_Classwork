class CreateDogToys < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_toys do |t|

      t.timestamps
    end
  end
end
