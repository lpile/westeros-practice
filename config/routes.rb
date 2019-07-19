Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/search', to: 'search#index'
end
