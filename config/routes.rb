Rails.application.routes.draw do
  get 'starships/:id', to: 'starships#show'

  get 'characters/:id', to: 'characters#show'

  root 'welcome#index'

  get '/films', to: 'films#show_all'

  get '/films/:id', to: 'films#show'

end
