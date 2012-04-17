HackerUnion::Application.routes.draw do

  devise_for :members

  root :to => "home#index"

  resources :members do
    member do
      put :approve
    end
    collection do
      get :pending
    end
  end

end
