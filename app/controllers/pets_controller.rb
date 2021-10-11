class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.customer_id = current_customer.id
    @pet.save
    redirect_to pet_path
  end

  def index
    @pet = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:image, :gender_id, :category_id, :breed, :age_id, :character, :reason)
  end

end
