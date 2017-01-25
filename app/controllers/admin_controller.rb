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

end
