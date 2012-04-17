HackerUnion::Application.routes.draw do

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
