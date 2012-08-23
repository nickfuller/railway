Railway::Application.routes.draw do
  
  root :to => 'Lines#index'

  get '/lines' => 'Lines#index', # WHY not :as=>'train_lines'?
  # BUT, would      root :to => 'Lines#index', :as => 'train_lines'           work just as well?
  
  get '/lines/new' => 'Lines#new', :as =>'new_train_line'
  post '/lines' => 'Lines#create', :as => train_lines
  
  get '/lines/:id' => 'Lines#show'
  # WHY not         get 'lines/:name' => 'Lines#show'                   instead?

  get '/lines/:id/edit' => 'Lines#edit', :as => 'edit_train_line' 
  put '/lines/:id' => 'Lines#update'
  # WHY not	post '/lines/:id/edit' => 'Lines#update' ?

  delete '/lines/:id' => 'Lines#destroy', :as => 'train_line'
  # WHAT is this saying? "On the /lines/:id page, I'll 
  # have the ability to call the destroy action from the 
  # LinesController"???
  
end
