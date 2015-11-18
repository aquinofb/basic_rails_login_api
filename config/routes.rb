Rails.application.routes.draw do
  namespace :api do
    resources :authentications, only: [] do
      collection do
        post :sign_in
        post :sign_up
      end
    end
  end
end
