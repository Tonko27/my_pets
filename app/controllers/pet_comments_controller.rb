class PetCommentsController < ApplicationController
  #def create
    #pet = Pet.find(params[:pet_id])
    #comment = PostComment.new(post_comment_params)
    #comment.customer_id = current_customer.id
    #comment.pet_id = pet.id
    #comment.save
    #redirect_to pet_path(pet)
  #end

  def create
    pet = Pet.find(params[:pet_id])
    @pet_comment = PetComment.new(pet_comment_params)
    @pet_comment.customer_id = current_customer.id
    @pet_comment.pet_id = pet.id
    @pet = @pet_comment.pet
    @pet_comment.save
    @pet.create_notification_pet_comment!(current_customer, @pet_comment.id)
      #petモデルの通知メソッド呼び出し
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
