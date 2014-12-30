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

  def property_type(deal)
    unless deal.property_type.nil?
      PropertyType.where(id: deal.property_type).first.name.capitalize
    end
  end

  def active_class_wo_class(path)
    if current_page?(path)
      'active'
    end
  end

  def property_type_active(type)
    @deal = Deal.find(params[:id])
    if @deal.property_type == type.id
      "active"
    end
  end

end
