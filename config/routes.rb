Rails.application.routes.draw do

  root 'sessions#new'

  get 'songs' => 'songs#index'

  get 'songs/:song_id' => 'songs#show'

  post 'songs' => 'songs#create'

  post 'songs/:song_id' => 'songs#add'

  post 'users' => 'users#create'

  get 'users/:user_id' => 'users#show'

  get 'sessions' => 'sessions#new'

  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  end