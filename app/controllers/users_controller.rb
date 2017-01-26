class UsersController < ApplicationController


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

  # Admin 

  def index
    self.admin_connected();
    @users = User.order('id DESC').paginate(:page => params[:page])
  end

  def show
    self.admin_connected();
    @user = User.find(params['id'])
  end

  def add
    self.admin_connected();
  end

  def create
    self.admin_connected();
    User.create(name: params['name'], surname: params['surname'], birthdate: params['birthdate'], email: params['email'], password: params['password'], city: params['city'], zipcode: params['zipcode'] )    

    redirect_to '/admin/users' + '?result=create'
  end

  def edit
      self.admin_connected();
      User.find(params['id']).update name: params['name'], surname: params['surname'], birthdate: params['birthdate'], email: params['email'], password: params['password'], city: params['city'], zipcode: params['zipcode']    
      
      redirect_to '/admin/users/' + params['id'].to_s + '?result=ok'
  end

  def delete
    self.admin_connected();
    User.find(params['id']).delete

    redirect_to '/admin/users/' + '?result=delete'
  end

  private
    def user_param
        params.require(:user).permit(:name, :surname, :birthdate, :email, :address, :zipcode, :city)
    end


end
