HackerUnion::Application.routes.draw do

  root :to => "members#index"

  devise_for :users

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
