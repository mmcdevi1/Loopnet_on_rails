class MarketPlacesController < ApplicationController
  before_action :authenticate_user!

	

	def index
		@deals = Deal.where(publish: false).order("created_at DESC")
	end



	





end
