HackerUnion::Application.routes.draw do

  devise_for :users

  root :to => "members#index"

  resources :users, :only => :show

  resources :members do
    member do
      put :approve
    end
    collection do
      get :pending
    end
  end

end
