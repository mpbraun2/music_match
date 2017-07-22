class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    redirect_to '/songs' if session[:user_id]
  end

  def create

    @user = User.find_by(email:params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      return redirect_to "/songs"
    else
      flash[:errors] = ["Invalid email or password"]
      return redirect_to '/sessions'
    end

  end

  def destroy
    session.clear
    return redirect_to '/sessions'
  end
end
