class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :customer_id
      t.integer :image_id
      t.integer :gender
      t.integer :type
      t.string :breed
      t.integer :age
      t.text :character
      t.text :reason
      t.timestamps
    end
  end
end
