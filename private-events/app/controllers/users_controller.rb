class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:signed] = @user.id
      flash[:success] = "Successfully created account!"
      redirect_to @user
    else
      flash[:error] = "No."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = User.find(params[:id]).attended_events.upcoming
    @past_events = User.find(params[:id]).attended_events.past
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
