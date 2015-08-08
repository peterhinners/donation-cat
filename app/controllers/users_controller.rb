class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = "Invalid Registration"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # if session[:user_id]
    #   @name = User.find(session[:user_id])
    # end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
