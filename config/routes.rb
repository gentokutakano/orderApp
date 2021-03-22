Rails.application.routes.draw do
  resources :orders do
  end

  resources :souko_zaikos, only:[:new, :create, :index]
  resources :order_items
  root 'orders#index'
end
