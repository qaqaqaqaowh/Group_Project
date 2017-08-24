class SessionsController < Clearance::SessionsController
	def redirect_signed_in_users
	    if signed_in?
	      redirect_to current_user
	    end
	end

	def url_after_create
	    user_path(current_user)
	end

	def url_after_destroy
	    sign_in_url
	end

	def url_for_signed_in_users
		url_after_create
	end
end