class PetsController < ApplicationController
  ### INDEX
  def index
    @pets = Pet.all
  end


  ### NEW
  def new
    @pet = Pet.new
    @owners = Owner.all
  end

  def create
    @pet = Pet.new(pet_params)
    @owners = Owner.all

    if @pet.valid?
      @pet.save
      flash[:message] = "Successfully created pet"
      redirect_to @pet
    else
      flash[:message] = @pet.errors.full_messages
      render :new
    end
  end


  ### EDIT
  def edit
    @pet = Pet.find(params[:id])
    @owners = Owner.all
  end

  def update
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    @pet.assign_attributes(pet_params)

    if @pet.valid?
      @pet.save
      flash[:message] = "Successfully edited pet"
      redirect_to @pet
    else
      flash[:message] = @pet.errors.full_messages
      render :edit
    end
  end


  ### SHOW
  def show
    @pet = Pet.find(params[:id])
  end


  ## DESTROY
  def destroy
    Pet.find(params[:id]).destroy
    redirect_to pets_path
  end


  ### OWNERLESS PETS
  def ownerless_pets
    @ownerless_pets = Pet.ownerless_pets
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :species, owner_ids: [])
  end
end
