class ImageGalleriesController < ApplicationController
  layout :deal_layout
  before_action :authenticate_user!

  def index
    @deal = Deal.find(params[:deal_id]) 
    @image_galleries = @deal.image_galleries.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_galleries.map{|image_galleries| image_galleries.to_jq_upload } }
    end
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @image_gallery = @deal.image_galleries.new(image_galleries_params)
    @image_gallery.user = current_user
    respond_to do |format|
      if @image_gallery.save
        format.html {
          render :json => [@image_gallery.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@image_gallery.to_jq_upload]}, status: :created }
      else
        format.html { render :new }
        format.json { render json: @image_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @deal = Deal.find(params[:deal_id]) 
    @image_gallery = @deal.image_galleries.find(params[:id])
    @image_gallery.destroy
    respond_to do |format|
      format.html { redirect_to image_galleries_url, notice: 'Image gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def image_galleries_params
    params.require(:image_gallery).permit(:deal_id, :deal_images)    
  end

  def deal_layout
    "deals"      
  end

end
