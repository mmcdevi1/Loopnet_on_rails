class ContactForDealsController < ApplicationController
  layout :deal_layout
  before_action :authenticate_user!
  before_action :correct_user, only: [:index]


  def index
    @deal = Deal.find(params[:deal_id])
    @contacts = current_user.contacts.all
    @contact_for_deals = @deal.contact_for_deals.all
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @contact = @deal.contact_for_deals.new(contact_for_deals_params)
    @contact.user = current_user
    if @contact.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def contact_for_deals_params
    params.require(:contact_for_deal).permit(:deal_id, 
                                             :contact_id, 
                                             :user_id)
  end

  def deal_layout
    "deals"
  end

  def correct_user
    @deal = Deal.find(params[:deal_id])
    unless current_user == @deal.user
      redirect_to root_path
      flash[:danger] = "You can't do that."
    end
  end    

end
