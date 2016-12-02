class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :infos, :insure]

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if params['user']['next']
      redirect_to new_place_path
    else
      redirect_to root_path
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :sex, :situation, :birth_date, :nb_children, :job)
  end

end
