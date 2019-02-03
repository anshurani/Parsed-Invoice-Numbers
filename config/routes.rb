Rails.application.routes.draw do
  # get 'invoice_parse/index'
  get 'welcome/index'
  resources :invoice_parse
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
end
