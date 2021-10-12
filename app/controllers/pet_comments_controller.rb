class PetCommentsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    comment = current_customer.pet_comments.new(pet_comment_params)
    comment.pet_id = pet.id
    comment.save
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
