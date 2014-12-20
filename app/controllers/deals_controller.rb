class DealsController < ApplicationController
  before_action :set_deal, except: [:index, :new, :create]
  layout :deal_layout

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.where(user_id: current_user.id).all
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @contacts = @deal.contacts.all
  end

  # GET /deals/new
  def new
    @deal = current_user.deals.new
  end

  # GET /deals/1/edit
  # def edit
  # end

  def address
  end

  def property_information
  end

  def overview
  end

  def photos
    @deal.image_galleries.build
  end



  # POST /deals
  # POST /deals.json
  def create
    @deal = current_user.deals.new(deal_params)
    respond_to do |format|
      if @deal.save
        format.html { redirect_to deals_address_path(@deal), notice: 'Saved.' }
        format.json { render action: 'show', status: :created, location: @deal }
      else
        format.html { render action: 'new' }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      session[:return_to] ||= request.referer
      if @deal.update(deal_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Saved.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end

  def deal_layout
    if params[:action] == "new" || params[:action] == "index"
      "application"
    else
      "deals"
    end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

  

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:property_name, 
                                   :user_id, 
                                   :property_address, 
                                   :state, 
                                   :city, 
                                   :zipcode,
                                   :owner_name,
                                   :floors,
                                   :sf,
                                   :year_built,
                                   :percent_leased,
                                   :property_class,
                                   :property_type,
                                   :deal_title,
                                   :deal_summary,
                                   image_galleries_attributes: [:user_id, :deal_id, :id, :deal_images, :_destroy])
    end
end








































