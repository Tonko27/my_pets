class Pet < ApplicationRecord
  belongs_to :customer
  
  attachment :image#gem:refileのルール

  extend ActiveHash::Associations::ActiveRecordExtensions#gem:active_hashに必要な記述
  belongs_to_active_hash :gender
  belongs_to_active_hash :category
  belongs_to_active_hash :age

end
