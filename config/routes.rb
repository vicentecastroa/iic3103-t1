Rails.application.routes.draw do
  get 'planets/:id', to: 'planets#show'

  get 'starships/:id', to: 'starships#show'

  get 'characters/:id', to: 'characters#show'

  root 'films#show_all'

  get '/films/:id', to: 'films#show'

  get 'search/search', to: 'search#search'

end
