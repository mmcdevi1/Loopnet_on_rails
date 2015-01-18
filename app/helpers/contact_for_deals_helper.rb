module ContactForDealsHelper

  def contact_list
    if @contact_for_deals.any?
      @contact_for_deals.each do |c|
        return Contact.where(id: c.contact_id).first.full_name
      end
    end
  end

end
