module DealsHelper

	def property_class
		@deal = Deal.find(params[:id])
		if (params[:action] == "property_information" && params[:controller] == "deals") && !@deal.property_class.nil?
	    return @deal.property_class
	  else
	  	return "Select Property Class"
	  end
	end

  def state_select
    @deal = Deal.find(params[:id])
    if (params[:action] == "address" && params[:controller] == "deals") && !@deal.state.nil?
      return @deal.state
    else
      return "Select State"
    end
  end




















end
