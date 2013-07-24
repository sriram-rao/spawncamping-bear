class SessionsController < ApplicationController

	def create
		auth = request.env["omniauth.auth"]
		user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.uid
		flash[:notice] = "Signed in!"
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Signed out!"
		$steam_user = nil
		redirect_to root_url
	end
end
