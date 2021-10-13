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

  has_many :notifications, dependent: :destroy

  def create_notification_favorite!(current_customer)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and pet_id = ? and action = ? ", current_customer.id, customer_id, id, 'favorite'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_customer.active_notifications.new(
        pet_id: id,
        visited_id: customer_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_pet_comment!(current_customer, pet_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PetComment.select(:customer_id).where(pet_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_pet_comment!(current_customer, pet_comment_id, temp_id['customer_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_pet_comment!(current_customer, pet_comment_id, customer_id) if temp_ids.blank?
  end

  def save_notification_pet_comment!(current_customer, pet_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_customer.active_notifications.new(
      pet_id: id,
      pet_comment_id: pet_comment_id,
      visited_id: visited_id,
      action: 'pet_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
