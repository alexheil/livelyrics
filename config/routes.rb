require 'api_constraints'

Rails.application.routes.draw do

  root 'static_pages#home'

  #get 'learn_how_it_works' => 'static_pages#learn'
  get 'privacy' => 'static_pages#privacy'
  get 'terms_of_use' => 'static_pages#terms'
  get 'dmca_policy' => 'static_pages#dmca'
  get 'contact' => 'static_pages#contact'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get "sign_out", to: "users/sessions#destroy"
    get "sign_in", to: "users/sessions#new"
    get "register", to: "users/registrations#new"
  end

  resources :artists, controller: 'artists/artists' do
    resources :albums, controller: 'artists/albums' do
      resources :lyrics, controller: 'artists/lyrics' do
        resources :comments, only: [:create, :destroy], controller: 'users/comments'
      end
    end
  end

  resources :users, only: [:show], controller: 'users/users'

  get 'leaderboards' => 'users/users#leaderboard'

  get 'numbers' => 'static_pages#numbers'
  get 'a' => 'static_pages#a'
  get 'b' => 'static_pages#b'
  get 'c' => 'static_pages#c'
  get 'd' => 'static_pages#d'
  get 'e' => 'static_pages#e'
  get 'f' => 'static_pages#f'
  get 'g' => 'static_pages#g'
  get 'h' => 'static_pages#h'
  get 'i' => 'static_pages#i'
  get 'j' => 'static_pages#j'
  get 'k' => 'static_pages#k'
  get 'l' => 'static_pages#l'
  get 'm' => 'static_pages#m'
  get 'n' => 'static_pages#n'
  get 'o' => 'static_pages#o'
  get 'p' => 'static_pages#p'
  get 'q' => 'static_pages#q'
  get 'r' => 'static_pages#r'
  get 's' => 'static_pages#s'
  get 't' => 'static_pages#t'
  get 'u' => 'static_pages#u'
  get 'v' => 'static_pages#v'
  get 'w' => 'static_pages#w'
  get 'x' => 'static_pages#x'
  get 'y' => 'static_pages#y'
  get 'z' => 'static_pages#z'

#  namespace :api, defaults: { format: :json } do
#    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
#      resources :artists, only: [:index, :show] do
#        resources :albums, only: :show do
#          resources :lyrics, only: :show
#        end
#      end
#    end
#  end

end