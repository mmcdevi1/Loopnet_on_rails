class ImageGalleriesController < ApplicationController
  layout :deal_layout

  def index
    @deal = Deal.find(params[:deal_id])    
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @image_gallery = @deal.image_galleries.new(image_galleries_params)
    @image_gallery.user = current_user
    if @image_gallery.save
      redirect_to :back
    else 
      render 'new'
    end
  end

  def update
  end

  private
  def image_galleries_params
    params.require(:image_gallery).permit(:deal_id, :deal_images)    
  end

  def deal_layout
    "deals"      
  end

end
