module NotificationsHelper
  def notification_form(notification)
  @pet_comment=nil
  visitor=link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
  your_pet=link_to 'あなたの投稿', notification.pet, style:"font-weight: bold;", remote: true
  case notification.action
    when "follow" then
      "#{visitor}があなたをフォローしました"
    when "favorite" then
      "#{visitor}が#{your_pet}にいいね！しました"
    when "pet_comment" then
      @pet_comment=PetComment.find_by(id:notification.pet_comment_id)&.comment
      "#{visitor}が#{your_pet}にコメントしました"
  end
  end
end
