class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:session][:name])
    if @user
      session[:signed] = @user.id
      flash[:success] = "Successfully signed up!"
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "No such user"
      render 'new'
    end
  end

  def destroy
    session[:signed] = nil
    redirect_to root_path
  end
end
