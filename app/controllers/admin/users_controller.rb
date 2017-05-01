class Admin::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_user, only:[:show,:edit, :update]
	layout "admin"

	def index 
    @users = User.all
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
    	respond_to do |format|
				format.html { redirect_to admin_user_path(@user)}
			end	
    	
    else
    	render :edit

    end
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @user = User.find(params[:id])
    @user.to_normal

    redirect_to admin_users_path
  end






	protected 
	def check_admin 
		unless current_user.role == "admin"
			raise ActiveRecord::RecordNotFound			
		end
	end
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name,:role)
	end



end
