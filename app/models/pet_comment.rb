class PetComment < ApplicationRecord
  belongs_to :customer#会員モデルに紐づけ
  belongs_to :pet#ペットモデルに紐づけ

  has_many :notifications, dependent: :destroy#通知機能

  validates :comment, presence: true# 空欄コメント防ぐ

end


