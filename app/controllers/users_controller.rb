class UsersController < ApplicationController
  def index
  end

  def inscription
  end

  def selfcreate
     
    # render plain: params[:user].inspect
    @user = User.new(user_param)
  end

  private
    def user_param
        params.require(:user).permit(:name, :surname, :birthdate, :email, :address, :zipcode, :city)
    end


end
