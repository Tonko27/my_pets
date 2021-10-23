class NotificationsController < ApplicationController
  def index
    @notifications = current_customer.passive_notifications.page(params[:page]).per(20)#ログイン会員に紐づいた通知、ページング
    @notifications.where(checked: false).each do |notification|#通知を確認していない(false)を表示
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to notifications_path
  end
end
