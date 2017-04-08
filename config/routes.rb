Rails.application.routes.draw do
 
	resources :products, only:[:index,:show] #前台只能看index和show頁面


end
