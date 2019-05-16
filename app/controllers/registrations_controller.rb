class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    	#complete this method
	    	@user = User.new(r_params)
		if @user.save
			flash[:notice] = "Registration correct"
			redirect_to "/"
		else
			flash[:notice] = "Wrong parameters"
			redirect_to registrations_url
		end
	end
	
	def r_params
	params.require(:registrations).permit(:name,:last_name,:email,:password,:phone)
	end
end
