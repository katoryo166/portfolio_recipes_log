Rails.application.routes.draw do

  devise_for :admins, :controllers => {
    :sessions => 'admin/admins/sessions',
    :registrations => 'admin/admins/registrations',
    :passwords => 'admin/admins/passwords'
   }

  devise_for :users, :controllers =>{
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }

  namespace :admin do
    resources :post_recipes, only:[:index, :show, :edit, :update, :destroy]
    resources :genres, only:[:index, :create, :edit, :update, :destroy]
    resources :users, only:[:index, :show, :edit, :update, :destroy]
  end

  resources :post_recipes, only:[:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end
  get 'search' => 'post_recipes#search'

  resources :users, only:[:show, :edit, :update]
    resource :users,only: [:show] do
  		collection do
    		get 'favorite_lists/:id' => 'users#favorite_lists',  as:'favorite_lists'
    	  get 'unsubscribe/:id' => 'users#unsubscribe',  as:'confirm_unsubscribe'
    	  patch 'withdraw/:id' => 'users#withdraw', as:'withdraw'
    	 end
    end

  root 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
