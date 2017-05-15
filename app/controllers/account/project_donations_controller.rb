class Account::ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@page_title = "我的贊助記錄"
    @donations = Donation.where(:user_id => current_user.id).order('created_at desc').page(params[:page]).per(8)
  end

  def show 
  	@page_title = "贊助細節"
  	@donation = Donation.find(params[:id])

  end 


end
