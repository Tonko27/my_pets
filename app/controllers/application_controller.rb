class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :email, :encrypted_password, :postalcode, :prefecture_id, :city, :building, :phone, :is_deleted])
    #devise新規登録データの許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :name, :email, :encrypted_password, :postalcode, :prefecture_id, :city, :building, :phone, :is_deleted])
    #devise会員編集データの許可
  end
end
