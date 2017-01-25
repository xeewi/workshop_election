class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

   def current_admin
    @_current_admin ||= session[:current_admin_id] &&
      Admin.find_by(id: session[:current_admin_id])
  end

  def admin_connected
  	@user = self.current_admin();
  	
  	if !@user
  		redirect_to "/admin/login"
  	end

  end
end
