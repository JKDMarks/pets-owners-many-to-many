class OwnersController < ApplicationController
  ### WELCOME
  # def home
  # end


  ### INDEX
  def index
    @owners = Owner.all
  end


  ### NEW
  def new
    @owner = Owner.new
    @pets = Pet.all
  end

  def create
    @owner = Owner.new(owner_params)
    @pets = Pet.all

    if @owner.valid?
      @owner.save
      flash[:message] = "Successfully created owner"
      redirect_to @owner
    else
      flash[:message] = @owner.errors.full_messages
      render :new
    end
  end


  ### EDIT
  def edit
    @owner = Owner.find(params[:id])
    @pets = Pet.all
  end

  def update
    @pets = Pet.all
    @owner = Owner.find(params[:id])
    @owner.assign_attributes(owner_params)

    if @owner.valid?
      @owner.save
      flash[:message] = "Successfully edited owner"
      redirect_to @owner
    else
      flash[:message] = @owner.errors.full_messages
      render :edit
    end
  end


  ### SHOW
  def show
    @owner = Owner.find(params[:id])
  end


  ## DESTROY
  def destroy
    Owner.find(params[:id]).destroy
    redirect_to owners_path
  end


  ### PETLESS OWNERS
  def petless_owners
    @petless_owners = Owner.petless_owners
  end


  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :age, :email, pet_ids: [])
  end
end
