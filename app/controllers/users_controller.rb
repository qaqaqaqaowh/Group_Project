class UsersController < Clearance::UsersController
	def url_after_create
		user_path(current_user)
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
    	first_name = user_params.delete(:first_name)
      last_name = user_params.delete(:last_name)

    	Clearance.configuration.user_model.new(user_params).tap do |user|
      		user.email = email
      		user.password = password
      		user.first_name = first_name
          user.last_name = last_name
      end
    end
end