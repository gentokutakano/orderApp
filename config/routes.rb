Rails.application.routes.draw do
  resources :orders do
  end

  resources :order_items
  root 'orders#index'
end
