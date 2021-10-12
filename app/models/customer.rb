class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions#gem:active_hashに必要な記述
  belongs_to_active_hash :prefecture#疑似モデル

  has_many :pets, dependent: :destroy#ペットモデルに紐づけ
  has_many :pet_comments, dependent: :destroy#ペットコメントモデルに紐づけ
  has_many :favorites, dependent: :destroy#お気に入りモデルに紐づけ
end
