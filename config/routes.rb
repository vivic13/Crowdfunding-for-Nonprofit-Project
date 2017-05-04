Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
	
  resources :stories, only:[:index,:show] , :controller => 'stories' do 
    resources :comments, only:[:create,:destroy], :controller => 'story_comments'
    member do 
      post :like ,:controller => 'stories'
      post :unlike,:controller => 'stories'
    end 

  end

  resources :projects, only:[:index,:show] do #前台只能看index和show頁面
		resources :donations, only:[:show,:new,:create], :controller => 'project_donations' do 
      member do
        post :checkout_pay2go
      end
    end
	end

	root :to =>'stories#index', :controller => 'stories'

  resources :tags, only:[:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  post 'pay2go/return'
  post 'pay2go/notify'

	namespace :admin do
    resources :stories ,:controller => 'stories' do 
      collection do
        get :home ,:controller => 'stories'
      end
    end
  	resources :projects do #後台CRUD都可
      resources :donation, only:[:index], :controller => 'project_donations'
      resource :report, :controller => 'project_reports'
    end
    
  	resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
    resources :tags
	end

  namespace :account do
    resources :stories do 
      collection do
        get :liked
      end
    end
    resources :project_donations
  end

	 #API routes path
  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      #devise_for :users
      post '/login' => 'auth#login'
      post '/logout' => 'auth#logout'
      resources :users
    end
  end 
  
  

  get '/aboutus', to: 'home#about', :controller => 'home'
  get '/contactus', to: 'home#contact', :controller => 'home'


end
