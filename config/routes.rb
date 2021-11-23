Rails.application.routes.draw do

  get 'users/:user_id', to: 'user#show'
  get 'gossips/:gossip_id', to: 'gossip#show'
  resources :gossips
  resources :users
  root to: 'homepage#show'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'team/show'
  get 'contact/show'
end
