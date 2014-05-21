class BrokersStepsController < ApplicationController
	include Wicked::Wizard
	steps :property_informations, :property_address

	def show
		render_wizard
	end

	
	private

		def layout
			'deals'
		end
end
