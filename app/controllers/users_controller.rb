class UsersController < ApplicationController
<<<<<<< HEAD
    def index
=======
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
>>>>>>> 6b0aacee93b5a4263969326e1f22a8869e861a9b
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

    def signup
        
    end

  private
    def user_param
        params.require(:user).permit(:name, :surname, :birthdate, :email, :address, :zipcode, :city)
    end


end
