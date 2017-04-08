Rails.application.routes.draw do
 
  devise_for :users
	resources :products, only:[:index,:show] #前台只能看index和show頁面
	root "products#index"

	namespace :admin do
  	resources :products  #後台CRUD都可
  	resources :npos 
	end

end
