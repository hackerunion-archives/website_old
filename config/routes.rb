Hackerunion::Application.routes.draw do

  root :to => "members#index"

  resources :members do
    member do
      put :approve
    end
    collection do
      get :pending
    end
  end

end
