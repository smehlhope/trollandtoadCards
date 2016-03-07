Rails.application.routes.draw do

  resources :cards do
    collection { post :import }
  end

  root 'cards#index'

end
