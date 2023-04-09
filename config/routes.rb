Rails.application.routes.draw do
  devise_for :users
root "homes#index"

# get 'musicgallery/index' ,to:'musicgallery#index'
resources :musics
resources :homes,only: :index

resources :musics do
member do
delete :purge_audio
end
end
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
end