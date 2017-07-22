class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create]

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/songs'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/sessions'
    end


  end

  def show
    @user = User.find(params[:user_id])
    @songs = @user.songs_with_count
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end



end