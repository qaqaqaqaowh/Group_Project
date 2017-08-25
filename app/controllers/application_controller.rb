class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

	def require_login
	    unless signed_in?
	      flash[:error] = "You must be logged in to access this section"
	      redirect_to welcome_index_path # halts request cycle
	    end
	end

end
