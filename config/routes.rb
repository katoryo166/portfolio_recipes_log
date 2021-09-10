Rails.application.routes.draw do

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
