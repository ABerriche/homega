class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :infos]

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if params['user']['next']
      redirect_to new_place_path
    else
      redirect_to user_path(@user)
    end
  end

  def infos
    #@user = current_user
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sex, :situation, :birth_date, :nb_children, :job)
  end

end
