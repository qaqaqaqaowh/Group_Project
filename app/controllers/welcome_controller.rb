class WelcomeController < ApplicationController

	def index
		if signed_in?
			redirect_to tournaments_path
		end
	end
end
