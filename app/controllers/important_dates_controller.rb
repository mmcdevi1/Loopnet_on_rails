class ImportantDatesController < ApplicationController
  layout :deal_layout
  before_action :authenticate_user!

  def index
    @deal = Deal.find(params[:deal_id])
    @dates = ImportantDate.where(deal_id: @deal).all.order("updated_at DESC")
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @date = @deal.important_dates.new(important_dates_params)
    @date.user = current_user
    if @date.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @deal = Deal.find(params[:deal_id])
    @date = @deal.important_dates.find(params[:id])
    @date.destroy
    redirect_to :back
  end

  private
  def important_dates_params
    params.require(:important_date).permit(:title, :date, :user_id, :deal_id)
  end

  def deal_layout
    "deals"
  end

end
