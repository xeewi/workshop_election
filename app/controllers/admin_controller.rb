class AdminController < ApplicationController
  
  #GET /admin/admins
  def index
  end

  # GET /admin/login
  def login
  	@err = params['err']
  end

  # POST /admin/login
  def auth
  	@admin = Admin.find_by username: params['username']
  	
  	if !@admin
  		redirect_to "/admin/login?err=user"
  	elsif @admin['password'] == params['password']
  		session['current_admin_id'] = @admin.id
  		redirect_to "/admin"
  	else
  		redirect_to "/admin/login?err=pass"
  	end
  end

  # POST /admin/logout
  def logout
    @user = session[:current_admin_id] = nil
    redirect_to root_url
  end

  # Admin 

  def index
    self.admin_connected();
    @admins = Admin.order('id DESC').paginate(:page => params[:page])
  end

  def show
    self.admin_connected();
    @admin = Admin.find(params['id'])
  end

  def add
    self.admin_connected();
  end

  def create
    self.admin_connected();
    Admin.create(username: params['username'], password: params['password'])    

    redirect_to '/admin/admins' + '?result=create'
  end

  def edit
    self.admin_connected();

    if params['username'] == ""
      redirect_to '/admin/admins/' + params['id'].to_s  + '?result=false'
      return
    end

    Admin.find(params['id']).update username: params['username']
    
    redirect_to '/admin/admins/' + params['id'].to_s + '?result=ok'
  end

  def edit_password
     self.admin_connected();
    
    if params['password'] == ""
      redirect_to '/admin/admins/' + params['id'].to_s  + '?result=false'
      return
    end

    Admin.find(params['id']).update password: params['password']
    
    redirect_to '/admin/admins/' + params['id'].to_s  + '?result=ok'  
  end

  def delete
    self.admin_connected();
    Admin.find(params['id']).delete

    redirect_to '/admin/admins/' + '?result=delete'
  end

end
