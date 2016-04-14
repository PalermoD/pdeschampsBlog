Rails.application.routes.draw do
  root 'static_pages#index'
  get 'about' => 'static_pages#about'
  get 'portfolio' => 'static_pages#portfolio'
  resources :articles

  
end
