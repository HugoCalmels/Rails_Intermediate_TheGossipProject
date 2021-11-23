Rails.application.routes.draw do
  root to: 'homepage#show'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'team/show'
  get 'contact/show'
end
