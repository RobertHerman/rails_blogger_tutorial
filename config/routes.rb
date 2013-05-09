Blogger::Application.routes.draw do
  root to: 'articles#index'

  #this tells Rails that we have a resource named articles and router should
  #expect RESTful interation to the resource
 
  match 'articles/month/:month' => 'articles#index_by_month_year' \
                                   ,:as => :month_articles \
                                   ,:via => :get
  resources :articles do
    resources :comments
  end

  resources :tags
  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]
  match 'login' => 'author_sessions#new'
  match 'logout' => 'author_sessions#destroy'

end
