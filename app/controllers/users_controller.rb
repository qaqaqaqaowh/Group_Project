class UsersController < Clearance::UsersController
  before_action :require_login, only: [:edit, :update, :destroy]

	def url_after_create
		user_path(current_user)
	end

	def redirect_signed_in_users
		if signed_in?
    		redirect_to tournaments_path
    end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    number = user_params.delete(:number)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.number = number
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(edit_params_user)
      if params[:user][:file]
        @user.avatar = params[:user][:file]
        @user.save!
      end
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @teams = Team.where(user_id: @user.id)
    @teams.each do |team|
      if team.users.first
        team.update(user_id: team.users.first.id)
        team.users.delete(team.users.first)
      else
        team.destroy
      end
    end
    @user.teams.delete
    @user.destroy
    sign_out
    redirect_to welcome_index_path
  end

  def myteam
    @user = User.find(params[:user_id])
    @myteams = @user.teams
  end
end

private
def edit_params_user
  params.require(:user).permit(:first_name, :last_name, :number)
end
