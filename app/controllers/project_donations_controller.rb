class ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_project, except:[:checkout_pay2go]

	def new 
		@page_title = "參與募資"
		@donation = @project.donations.build
	end 

	def create 
		if @project.done == true || DateTime.now > @project.due_date
			redirect_to project_path(@project)
	 		flash[:alert] = "很可惜，已結束募資!"	
		else
			@donation = @project.donations.build(donation_params)
			@donation.user_id = current_user.id

			if @donation.save		
				redirect_to project_donation_path(@project,@donation)
			else
				render :new
			end
		end
	end


	def show 
		@page_title = "您的捐款資訊"
		@donation = @project.donations.find(params[:id])
		

			
	end 

	def checkout_pay2go
		@donation = current_user.donations.find( params[:id] )

		if @donation.paid?
			redirect_to :back, alert: 'already paid!'
		else
			@payment = Payment.create!( :donation => @donation,:payment_method => params[:payment_method],
                                  :amount => @donation.amount )
			render :layout => false
		end
	end

	protected 

	def find_project
		@project = Project.find(params[:project_id])
	end

	def donation_params
		params.require(:donation).permit(:name, :amount, :payment_status)
	end

	
end
