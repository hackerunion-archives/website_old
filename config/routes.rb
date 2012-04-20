HackerUnion::Application.routes.draw do

  devise_for :members, :controllers => {:omniauth_callbacks => 'members/omniauth_callbacks'}

  root :to => "home#index"

  resources :members do
    member do
      put :approve
      put :toggle_ambassador
      put :toggle_admin
      get :edit_profile
    end
    collection do
      get :pending
    end
  end

  [:events, :announcements].each do |thing|
    resources thing do
      member do
        put :approve
      end
      collection do
        get :pending
      end
    end
  end

end
