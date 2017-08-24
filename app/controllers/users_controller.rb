class UsersController < Clearance::UsersController
	def url_after_create
		redirect_to user_path(current_user)
	end

	def redirect_signed_in_users
		if signed_in?
    		redirect_to user_path(current_user)
    	end
	end

	def show
		@user = User.find(current_user.id)
	end

	def user_from_params
    	email = user_params.delete(:email)
    	password = user_params.delete(:password)
    	name = user_params.delete(:name)

    	Clearance.configuration.user_model.new(user_params).tap do |user|
      		user.email = email
      		user.password = password
      		user.name = name
      	end
    end
end