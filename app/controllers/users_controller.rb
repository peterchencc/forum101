class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end


  def edit
    if current_user.id == params[:id].to_i
      @user = User.find( params[:id] )
    else
      flash[:alert] = "哈哈哈！"
      redirect_to root_path
    end
  end

  def update

    @user = User.find( params[:id] )
    if @user.update( user_params )
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:nickname, :bio)
  end

end
