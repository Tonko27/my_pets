class PetCommentsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    comment = current_customer.pet_comments.new(pet_comment_params)#ログインしている会員IDでコメント投稿
    comment.pet_id = pet.id
    comment.save
    @pet.create_notification_pet_comment!(current_customer, @pet_comment.id)
    redirect_to pet_path(pet)
  end

  def destroy
    PetComment.find_by(id: params[:id]).destroy
    redirect_to pet_path(params[:pet_id])
  end

  private

  def pet_comment_params
    params.require(:pet_comment).permit(:comment)
  end
end
