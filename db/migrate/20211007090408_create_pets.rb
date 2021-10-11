class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :customer_id
      t.integer :image_id
      t.integer :gender_id
      t.integer :category_id
      t.string :breed
      t.integer :age_id
      t.text :character
      t.text :reason
      t.timestamps
    end
  end
end
