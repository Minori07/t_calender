Rails.application.routes.draw do
	get 'members/cfg'
	get 'members/month'
	get 'members/list/:date', to: 'members#list', as: 'date_list'
    devise_for :users
    resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/top" => "home#top"
end
