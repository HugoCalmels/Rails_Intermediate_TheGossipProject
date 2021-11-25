Rails.application.routes.draw do


  resources :gossips do 
    get 'gossips/:gossip_id', to: 'gossips#show'
    resources :comments do
    end
  end
  resources :users do 
    get 'users/:user_id', to: 'users#show'
  end
  root to: 'homepage#show'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'team/show'
  get 'contact/show'

end
