require 'steam/community/dota2/dota2_inventory'
require 'json'
class HomeController < ApplicationController

	def index
		current_user
   	end

	def items
		@result = Image.all
	end

	def profile
		@items = []
		if(current_user)
		@user ||= SteamId.new(current_user.uid.to_i)
		setInventory unless !@inventory.nil?
	   	@inventory.items.each do |item|
	   		 if !item.nil?
	   		 temp = Image.find_by_item_id(item.defindex)
	   		 if params[:search].nil?
	   			@items << [:img =>  temp[:url] , :quality => item.quality , :item_name => temp[:item_name] , :rarity => temp[:rarity]]
	   		 else
	   			if temp[:item_name].downcase.include? params[:search].downcase
		   			@items << [:img =>  temp[:url] , :quality => item.quality , :item_name => temp[:item_name] , :rarity => temp[:rarity]]
		   		end
		   	end
	   	end

	   end
	   end

	end
end
