Rails.application.routes.draw do
  resources :items, :only => [:show]
  resources :monsters, :only =>[:index]
end
