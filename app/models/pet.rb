class Pet < ApplicationRecord
  belongs_to :customer#会員モデルと紐づけ
  
  attachment :image#gem:refileのルール

  extend ActiveHash::Associations::ActiveRecordExtensions#gem:active_hashに必要な記述
  belongs_to_active_hash :gender#変わらない情報のため疑似モデル作成↓
  belongs_to_active_hash :category
  belongs_to_active_hash :age
  
  has_many :pet_comments, dependent: :destroy#ペットコメントモデルに紐づけ

end
