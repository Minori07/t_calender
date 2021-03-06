Rails.application.routes.draw do
  get 'home/index'
	get 'members/cfg'
	get 'members/month'
  get 'members/help'
	get 'members/list/:date', to: 'members#list', as: 'date_list'
    devise_for :users
    resources :members
    resources :memos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/top" => "home#top"

  devise_scope :user do
    	get '/users/sign_out' => 'devise/sessions#destroy'
  	end
  authenticated :users do
		root :to => "home#index"
	end

	unauthenticated :users do
	    root :to => "members#index"
	end

end
