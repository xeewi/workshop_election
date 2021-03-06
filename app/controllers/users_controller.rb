require 'digest/md5'
class UsersController < ApplicationController

    def index
    end

    def inscription
    end

    def selfcreate
        # render plain: params[:user].inspect
        @user = User.new(user_param)
        @user.password = Digest::MD5.hexdigest(@user.password)

        if @user.save
          toUrl = request.original_url
          # UserMailer.create_password_email(@user, toUrl).deliver_now
          redirect_to '/home/index?inscription=success'
        else
          render '/users/inscription?err=incorrect'
        end
    end

    def select
      param = params["user"]
      @user = User.find_by(email: param['email'])

      # render plain: param["password"].inspect
      if !@user
        redirect_to "/users/connexion?err=user"
      elsif @user.password ==  Digest::MD5.hexdigest(param['password'])
        session['current_user_id'] = @user.id
        redirect_to "/home/index?login=success"
      else
        redirect_to "/users/connexion?err=pass"
      end
    end

    def signout
      @user = session[:current_user_id] = nil
      redirect_to root_url
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

  def add_types
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

    candidats = Candidat.where(user_id: params['id'])

    if candidats.blank?
      User.find(params['id']).delete

      redirect_to '/admin/users/' + '?result=delete'
      return     
    end

    candidatsElections = CandidatsElection.where(candidat_id: candidats[0]['id'])
    
    candidatsElections.each do |candidatElection|
      CandidatsElection.delete(candidatElection['id'])
    end

    candidats.each do |candidat|
      Candidat.delete(candidat['id'])
    end

    User.find(params['id']).delete

    redirect_to '/admin/users/' + '?result=delete'
  end

    private
        def user_param
            params.require(:user).permit(:name, :surname, :birthdate, :email, :address, :zipcode, :city, :password)
        end


end
