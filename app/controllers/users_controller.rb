class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :infos, :insure]

  def show

  end

  def edit
    update
  end

  def update
    if params[:user][:already_insured] == "Oui"
      @user.already_insured = true
      #redirect_to une page où on peut uploader le contrat assurance
    elsif params[:user][:already_insured] == "Non"
      @user.already_insured = false
      #redirect_to une page de devis
    end
    #@user.birth_date = params[:user][:birth_date].strftime('%Y-%m-%d')
    @user.update(user_params)
    redirect_to new_place_path
  end

  def infos

  end

  def insure
    @user.insured = true
    @user.save
    redirect_to root_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sex, :situation, :birth_date, :nb_children, :job, :already_insured)
  end

end
