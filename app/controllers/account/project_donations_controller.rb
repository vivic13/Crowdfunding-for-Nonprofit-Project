class Account::ProjectDonationsController < ApplicationController
	layout "account"
	def index
  	@user = current_user
    @donations = Donation.where(:user_id => current_user.id)
  end
end
