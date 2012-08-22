Railway::Application.routes.draw do
  
  get '/lines' => 'Lines#index', :as => 'lines'
  # BUT, would      root :to => 'Lines#index', :as => 'lines'           work just as well?
  
  get '/lines/new'
  post '/lines' => 'Lines#create'
  
  get '/lines/:id' => 'Lines#show'
  # WHY not         get 'lines/:name' => 'Lines#show'                   instead?

  get '/lines/:id/edit' => 'Lines#edit'
  
end
