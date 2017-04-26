require 'rails_helper'


RSpec.describe ProductsController, type: :controller do
	before(:all) do 
 		@npo = Npo.create(:name => "da",)
  	@product_1 = Product.create(npo: @npo, :name => "car", :description => "This is a car",:cost => 2000,:unit => 100, :unit_price => 200,:due_date => "2017-06-20",
 														:cost_detail => "dfdsaf dfe")
  end
	it "#index" do 
		get :index
		expect(response).to have_http_status(200)
		expect(response).to render_template(:index)

	end
	it "#show" do 
		get :show , params: { id: @product_1.id }
		expect(response).to have_http_status(200)
		expect(response).to render_template(:show)
	end
end
