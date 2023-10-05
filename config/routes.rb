Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  root "users#index"

    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create]

  post '/posts/:post_id/comments', to: 'comments#create', as: 'post_comments'
  post '/posts/:post_id/likes', to: 'likes#create', as: 'post_likes'
end
