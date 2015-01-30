Rails.application.routes.draw do
  root 'uploads#new'
  resources :uploads

  get '/download/:id' => 'uploads#download', as: :download

end
