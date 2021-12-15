class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions # gem:active_hashに必要な記述
  belongs_to_active_hash :prefecture # 疑似モデル

  has_many :pets, dependent: :destroy # ペットモデルに紐づけ
  has_many :pet_comments, dependent: :destroy # コメント機能
  has_many :favorites, dependent: :destroy # お気に入り機能

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy # 通知機能
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # メールアドレスのフォーマット正規表現

  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
  validates :password, presence: true
  validates :nickname, presence: true
  validates :name, presence: true
  validates :postalcode, presence: true, length: { minimum: 7, maximum: 7 }
  validates :prefecture_id, presence: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 11 }
end
