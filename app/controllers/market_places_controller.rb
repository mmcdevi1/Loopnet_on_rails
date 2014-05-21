class MarketPlacesController < ApplicationController

	layout :layout

	def index
		@deals = Deal.all
	end



	def layout
		"market"
	end





end
