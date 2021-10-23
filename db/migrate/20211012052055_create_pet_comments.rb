class CreatePetComments < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
