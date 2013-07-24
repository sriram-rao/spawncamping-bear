require 'steam/community/dota2/dota2_inventory'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :null_session
   helper_method :current_user
   attr_accessor :inventory
   def setInventory
      @inventory ||= Dota2Inventory.new(current_user.uid.to_i)
    end

   private

   def current_user
   	@current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
   	return @current_user
   end











end
