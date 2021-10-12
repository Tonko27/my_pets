class Pet < ApplicationRecord
  belongs_to :customer#会員モデルと紐づけ
  
  attachment :image#gem:refileのルール

  extend ActiveHash::Associations::ActiveRecordExtensions#gem:active_hashに必要な記述
  belongs_to_active_hash :gender#変わらない情報のため疑似モデル作成↓
  belongs_to_active_hash :category
  belongs_to_active_hash :age
  
  has_many :pet_comments, dependent: :destroy#ペットコメントモデルに紐づけ
  has_many :favorites, dependent: :destroy#お気に入りモデルに紐づけ

  def favorited_by?(customer)#お気に入りにログイン会員が含まれているか判定するメソッド
    favorites.where(customer_id: customer.id).exists?
  end

end
