class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "you have successfully login"
    else
      flash.now[:alert] = "Email or Password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "you have successfully logout"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
