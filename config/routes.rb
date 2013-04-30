Blogger::Application.routes.draw do
  #this tells Rails that we have a resource named articles and router should
  #expect RESTful interation to the resource
  resources :articles
end
