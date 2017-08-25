class WelcomeController < ApplicationController
	skip_before_action :require_login

	def index
		if signed_in?
			redirect_to tournaments_path
		end
	end
end
