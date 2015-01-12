class ContactsController < ApplicationController
  layout :deal_layout
  before_action :authenticate_user!

  def index
    @deal = Deal.find(params[:deal_id])
    @contacts = @deal.contacts.all
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @contact = @deal.contacts.new(contacts_params)
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
  def contacts_params
    params.require(:contact).permit(:full_name)
  end

  def deal_layout
    "deals"      
  end

end
