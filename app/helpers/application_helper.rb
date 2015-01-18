module ApplicationHelper

	# render market places aside if controller is market places
	def market_places_aside
		if params[:controller] == "market_places"
			render 'layouts/aside/market_places'
		end
	end

	# render broker form aside if controller is deals
	def broker_form_aside
		if params[:controller] == "deals" && params[:action] == "index"
			render 'layouts/aside/deals_index'
		elsif params[:controller] == "deals" || params[:controller] == "brokers_steps"
			render 'layouts/aside/brokerform_aside'
		end
	end

	# padding for aside except deals controller
	def p_lg
		if params[:controller] == 'deals' || params[:controller] == "brokers_steps"
			if params[:controller] == "deals" && params[:action] == "index"
				'p-lg'
			end
		else
			'p-lg' 
		end
	end

	def new_deal_btn
		if params[:controller] == "deals" || params[:controller] == "brokers_steps"
			if params[:controller] == 'deals' && params[:action] == "index"
				link_to "Add New Deal", '#', class: "btn btn-success btn-block", data: {toggle: 'modal', target: '#deals_modal'}
			end
		else
			link_to "Add New Deal", '#', class: "btn btn-success btn-block", data: {toggle: 'modal', target: '#deals_modal'}
		end
	end

	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
			:autolink => true, :space_after_headers => true, :no_intra_emphasis => true, :strikethrough => true,
			:underline => true, :quote => true, :headers => true)
		markdown.render(text).html_safe
	end

	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-success"
		else
			""
		end
	end

	def full_name
		current_user.firstname + " " + current_user.lastname
	end

	def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

	def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def add_new_deal_btn
		if current_user.type_of_user == 1
			link_to "Add New Deal", new_deal_path, class: "btn btn-info btn-sm btn-block btn-shadow m-b-lg"
		end 
  end

  def add_to_pipeline_btn(deal)
  	if AddToPipeline.where(user_id: current_user.id, deal_id: deal.id).any?
    	link_to "Remove from Pipeline", remove_deal_deal_path(deal), class: "btn btn-danger btn-shadow", id: "btn-market-#{deal.id}", method: :delete
    else
    	link_to "Add to Pipeline", add_to_pipeline_deal_path(deal), class: "btn btn-danger btn-shadow", id: "btn-market-#{deal.id}", method: :post
    end
  end


end


























