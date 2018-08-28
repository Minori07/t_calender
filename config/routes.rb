Rails.application.routes.draw do
	get 'members/cfg'
    devise_for :users
    resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/top" => "home#top"
end
