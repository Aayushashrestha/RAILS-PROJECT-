Rails.application.routes.draw do
  devise_for :users, components: {articles: 'articles', sessions: 'sessions'}
  resources :users
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end
end
  #root 'welcome#index'

