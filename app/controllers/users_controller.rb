class UsersController < ApplicationController
  def index
  end

  def inscription
  end

  def selfcreate
     
    # render plain: params[:user].inspect
    @user = User.new(user_param)

    if @user.save
        toUrl = request.original_url
            UserMailer.create_password_email(@user, toUrl).deliver_now
            redirect_to :home
      else
          render 'inscription'
    end

  end

  private
    def user_param
        params.require(:user).permit(:name, :surname, :birthdate, :email, :address, :zipcode, :city)
    end


end
