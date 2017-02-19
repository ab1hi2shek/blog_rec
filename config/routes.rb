Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :forums
  root 'posts#index'
end
