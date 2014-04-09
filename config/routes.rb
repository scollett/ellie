Ellie::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'items/:id' => 'items#show', constraints: { id: /.+\.\w+/ }
  get 'records/:id' => 'records#show', constraints: { id: /.+\:\w+/ }
  get 'search/run' => 'search#run'
  root 'search#new'
  
end
