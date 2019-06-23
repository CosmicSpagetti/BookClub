Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # resources :books do
  #   resources :reviews, only: [:new, :create]
  # end
  
  get '/books', to: 'books#index', as: :books
  post '/books', to: 'books#create'
  get '/books', to: 'books#new', as: :new_book
  get '/books/:id/edit', to: 'books#edit', as: :edit_book
  get '/books/:id', to: 'books#show', as: :book
  patch '/books/:id', to: 'books#update'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
  get '/books/:book_id/reviews/new', to: 'reviews#new', as: :new_book_review
  post '/books/:book_id/reviews', to: 'reviews#create', as: :book_reviews

  # resources :authors, only: [:show, :destroy]  
  get '/authors/:id', to: 'authors#show', as: :author
  delete '/authors/:id', to: 'authors#destroy'

  # resources :reviews, except: :index
  get '/reviews/:id', to: 'reviews#show', as: :review
  patch '/reviews/:id', to: 'reviews#update'
  put '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy'
  get '/reviews/new', to: 'reviews#new', as: :new_review
  get '/reviews/:id/edit', to: 'reviews#edit', as: :edit_review
  post '/reviews', to: 'reviews#create', as: :reviews

  # resources :users, only: [:show, :destroy]
  get '/users/:id', to: 'users#show', as: :user
  delete '/users/:id', to: 'users#destroy'
end
