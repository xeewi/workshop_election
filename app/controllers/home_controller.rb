class HomeController < ApplicationController
  def index
    
  end

  def admin
  	self.admin_connected();

  	@users = User.last(5)
  	@elections = Election.last(5)
  	
  end
end
