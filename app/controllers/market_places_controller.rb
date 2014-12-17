class MarketPlacesController < ApplicationController

	

	def index
		@deals = Deal.all.order("created_at DESC")
	end



	





end
