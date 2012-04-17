HackerUnion::Application.routes.draw do

  resources :events do
    member do
      put :approve
    end
    collection do
      get :pending
    end
  end

  devise_for :members

  root :to => "home#index"

  resources :members do
    member do
      put :approve
      put :toggle_ambassador
    end
    collection do
      get :pending
    end
  end

end
