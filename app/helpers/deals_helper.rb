module DealsHelper

	def property_class
		@deal = Deal.find(params[:id])
		if (params[:action] == "property_information" && params[:controller] == "deals") && !@deal.property_class.nil?
	    return @deal.property_class
	  else
	  	return "Select Property Class"
	  end
	end




















end
