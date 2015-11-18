Rails.application.routes.draw do
  namespace :api do
    resources :authentications, only: [] do
      post :sign_in
    end
  end
end
