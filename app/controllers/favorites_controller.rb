class FavoritesController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    favorite = current_customer.favorites.new(pet_id: pet.id)
    favorite.save
    pet.create_notification_favorite!(current_customer)
    redirect_to pet_path(pet)
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorite = current_customer.favorites.find_by(pet_id: pet.id)
    favorite.destroy
    redirect_to pet_path(pet)
  end
end
