class StaticPagesController < ApplicationController
  # before_action :authenticate_user!
	# before_action :redirect_after_sign_in

  def home
    @deals = Deal.all
  end

  def redirect_after_sign_in
    if user_signed_in?
      redirect_to deals_path
    end
  end

end
