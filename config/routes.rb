Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  get 'homes/top'
  get 'homes/about'
  namespace :admin do
    get 'post_recipes/index'
    get 'post_recipes/show'
    get 'post_recipes/edit'
  end
  get 'post_recipes/index'
  get 'post_recipes/show'
  get 'post_recipes/new'
  get 'post_recipes/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/favorite_list'
  get 'users/unsubscribe'
  devise_for :admins, :controllers => {
    :sessions => 'admin/admins/sessions',
    :registrations => 'admin/admins/registrations',
    :passwords => 'admin/admins/passwords'
   }

  devise_for :users, :controller =>{
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
