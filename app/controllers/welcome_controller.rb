class WelcomeController < ApplicationController
	include Clearance::Controller
 	protect_from_forgery with: :exception

	def index
		if signed_in?
			redirect_to tournaments_path
		end
	end
end
