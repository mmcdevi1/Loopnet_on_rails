class MarketPlacesController < ApplicationController

	

	def index
		@deals = Deal.where(publish: false).order("created_at DESC")
	end



	





end
