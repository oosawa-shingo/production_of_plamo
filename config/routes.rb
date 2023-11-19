Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    get 'post_comments/destroy'
    resources :post_plamos, only: [:show, :index, :destroy]
    resources :post_reviews, only: [:show, :index, :destroy]
    resources :end_users, only: [:show, :index, :edit, :update]
    resources :tags, only: [:index, :create, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'end_users/confirm'
    patch 'end_users/withdrawn'
    get '/end_users/my_page' => 'end_users#show'
    get '/end_users/my_page/edit' => 'end_users#edit'
    patch '/end_users/my_page/edit' => 'end_users#update'
    get "search" => "post_plamos#search"
    resources :post_plamos, only: [:new, :show, :index, :edit, :update, :create, :destroy]
    resources :post_reviews, only: [:new, :show, :index, :edit, :update, :create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :usefuls, only: [:create, :destroy]
  end

end
