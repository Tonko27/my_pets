class PetCommentsController < ApplicationController
  before_action :set_pet

  def create
    @pet = Pet.find(params[:pet_id])
    @pet_comment = PetComment.new(pet_comment_params)
    @pet_comment.customer_id = current_customer.id
    @pet_comment.pet_id = @pet.id
    if @pet_comment.save
      @pet.create_notification_pet_comment!(current_customer, @pet_comment.id)
      @pet_comment = PetComment.new
      #petモデルの通知メソッド呼び出し
      #redirect_to pet_path(pet) #非同期通信、js.erbへ
    end
  end

  def destroy
    PetComment.find_by(id: params[:id]).destroy
    #redirect_to pet_path(params[:pet_id]) #非同期通信、js.erbへ
  end

  private

  def pet_comment_params
    params.require(:pet_comment).permit(:comment)
  end

  def set_pet
   @pet = Pet.find(params[:pet_id])
  end
end
