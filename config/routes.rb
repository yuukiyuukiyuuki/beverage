Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :customers
  # 顧客
  scope module: :public do
    root to: 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
