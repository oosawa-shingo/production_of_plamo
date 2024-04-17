Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  devise_scope :admin do
    get '/admin/sign_out', to: 'devise/sessions#destroy'
  end

  devise_scope :end_user do
    post '/end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    get '/end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    get '/end_users/sign_out', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :post_plamos, only: [:show, :index, :destroy]
    resources :post_reviews, only: [:show, :index, :destroy]
    resources :end_users, only: [:show, :index, :edit, :update]
    resources :tags, only: [:index, :create, :destroy]
    resources :post_comments, only: [:destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'end_users/confirm'
    get 'end_users/plamos'
    get 'end_users/reviews'
    get 'end_users/comments'
    get '/end_users/my_page/favorites' => 'end_users#favorites'
    get '/end_users/my_page/usefuls' => 'end_users#usefuls'
    patch 'end_users/withdrawn'
    get '/end_users/my_page' => 'end_users#show'
    get '/end_users/my_page/edit' => 'end_users#edit'
    patch '/end_users/my_page/edit' => 'end_users#update'
    get 'search' => 'post_plamos#search'
    get 'search' => 'post_reviews#search'
    resources :post_plamos, only: [:new, :show, :index, :edit, :update, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :post_reviews, only: [:new, :show, :index, :edit, :update, :create, :destroy] do
      resource :usefuls, only: [:create, :destroy]
    end
    resources :post_comments, only: [:create, :destroy]
  end

end
