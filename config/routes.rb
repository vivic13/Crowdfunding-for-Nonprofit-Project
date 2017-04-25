Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	resources :products, only:[:index,:show] do #前台只能看index和show頁面
		resources :donations, only:[:show,:new,:create], :controller =>"product_donations"
	end
	root "products#index" 

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

	namespace :admin do
  	resources :products do #後台CRUD都可
      resources :donation, only:[:index], :controller =>"product_donations"
    end
  	resources :npos 
  	resources :users
	end

	 #API routes path
  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      #devise_for :users
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
      resources :users
    end
  end 
  
  

  get"/aboutus", to:"home#about", :controller => 'home'
  get"/npos", to:"home#npos", :controller => 'home'
  get"/companies_and_celebrities", to:"home#public", :controller => 'home'


end
