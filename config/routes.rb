Rails.application.routes.draw do
  get "order_items/delete", to: "order_items#delete", as: "order_item_delete_all"
  get "orders/place_order/:total", to: "orders#place_order",as: "place_order"
  get "orders/all_orders", to: "orders#all_orders", as: "all_orders"
  resources :items, only: [:index]  
  resources :orders 
  resources :order_items

  resources :bookings do 
    collection do 
      get :select_date
      get :select_time
    end 
  end   
  
  root 'items#index' 

end

