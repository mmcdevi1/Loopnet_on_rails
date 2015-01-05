class ImportantDocsController < ApplicationController
  layout :deal_layout

  def index
    @deal = Deal.find(params[:deal_id])
    @docs = ImportantDoc.where(deal_id: @deal).all.order("updated_at DESC")
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @doc = @deal.important_docs.new(important_docs_params)
    @doc.user = current_user
    if @doc.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @deal = Deal.find(params[:deal_id])
    @doc = @deal.important_docs.find(params[:id])
    @doc.destroy
    redirect_to :back
  end

  private
  def important_docs_params
    params.require(:important_doc).permit(:deal_id, :user_id, :doc_files)
  end

  def deal_layout
    "deals"
  end

end
