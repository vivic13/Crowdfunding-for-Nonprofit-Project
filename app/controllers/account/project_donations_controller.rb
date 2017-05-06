class Account::ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@page_title = "我的捐贈記錄"
    @donations = Donation.where(:user_id => current_user.id).order('created_at desc')
  end

  def show 
  	@page_title = "捐增細節"
  	@donation = Donation.find(params[:id])

  end 


end
