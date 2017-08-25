class UsersController < Clearance::UsersController
  before_action :require_login, only: [:update, :destroy]

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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(edit_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.teams.delete
    @user.destroy
    sign_out
    redirect_to root_path
  end
end

private
def edit_params
  params.require(:user).permit(:first_name, :last_name)
end
