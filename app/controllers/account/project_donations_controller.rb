class Account::ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
  	@user = current_user
    @donations = Donation.where(:user_id => current_user.id)
  end
end
