module NotificationsHelper
  def notification_form(notification)
    @pet_comment = nil
    visitor = link_to notification.visitor.nickname, notification.visitor, style: 'font-weight: bold;'
    your_pet = link_to 'あなたの投稿', notification.pet, style: 'font-weight: bold;'
    case notification.action
    when 'follow'
      "#{visitor}があなたをフォローしました"
    when 'favorite'
      "#{visitor}が#{your_pet}をお気に入りしました"
    when 'pet_comment'
      @pet_comment = PetComment.find_by(id: notification.pet_comment_id)&.comment
      "#{visitor}が#{your_pet}にコメントしました"
    end
  end
end
