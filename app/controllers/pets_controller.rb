class PetsController < ApplicationController
  before_action :set_q,only: [:index,:search]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.customer_id = current_customer.id
    @pet.save
    redirect_to pet_path(@pet.id)
  end

  def index
    @pet = Pet.page(params[:page]).reverse_order#ページング機能
  end

  def show
    @pet = Pet.find(params[:id])
    @pet_comment = PetComment.new#詳細画面からコメント入力
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to pet_path(pet)
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pets_path
  end

  def search
    @results = @q.result
  end

  private

  def pet_params#active_hash使用のため一部カラムは"_id"表示
    params.require(:pet).permit(:image, :gender_id, :category_id, :breed, :age_id, :character, :reason)
  end

  def set_q
    @q = Pet.ransack(params[:q])
  end

end
