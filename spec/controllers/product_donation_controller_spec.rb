require 'rails_helper'

RSpec.describe ProductDonationsController, type: :controller do

	include EmailSpec::Helpers
  include EmailSpec::Matchers

	before(:each) do	
    @user = User.create(:email =>"example@gmail.com",:password =>"123456",password_confirmation:"123456" ) 
    @user.confirmed_at = Time.zone.now
    controller.sign_in(@user, scope: :user)
  end

  before(:all) do 
  	DatabaseCleaner.clean
  	@npo = Npo.create(:name => "da")
  	@product_1 = Product.create(npo: @npo, :name => "car", :description => "This is a car",:cost => 2000,:unit => 100, :unit_price => 200,:due_date => "2017-06-20",
 														:cost_detail => "dfdsaf dfe")
  end

  it "#new" do 
		get :new ,{:product_id => @product_1.id}
		expect(response).to have_http_status(200)
		expect(response).to render_template(:new)
	end


	#		it "create record" do 
	#		expect{post :create, donation: FactoryGirl.attributes_for(:donation)}.to change(Product,:count).by(1)
	#		expect(response).to have_http_status(302)
	#		expect(response).to redirect_to(product_donation_path(Product.last.id))
	#	end




end
