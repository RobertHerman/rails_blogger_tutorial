Blogger::Application.routes.draw do
  root to: 'articles#index'

  #this tells Rails that we have a resource named articles and router should
  #expect RESTful interation to the resource
  resources :articles do
    resources :comments
  end
end
