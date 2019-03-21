Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/films', to: 'films#show_all'

  get '/films/:id', to: 'films#show'

end
