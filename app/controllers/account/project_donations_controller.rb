class Account::ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
    @donations = Donation.where(:user_id => current_user.id).order('created_at desc')
  end

  def show 
  	@donation = Donation.find(params[:id])

  end 


end
