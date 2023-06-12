Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #顧客部分
  scope module: :public do
    root to: 'homes#top'

    #ドリンク
    resources :drinks

    #顧客
    resources :customers, only: [:index, :show, :edit, :update]

    #いいね
    resource :favorites, only: [:create, :destroy]

    #フォロー
    get 'followings' => 'relationships#followings', as: 'followings'

    #フォロワー
    get 'followers' => 'relationships#followers', as: 'followers'

    #検索
    get "search" => "searches#search"

  end

  #管理者部分
  namespace :admin do

    #商品
     resources :drinks, only: [:index, :show, :destroy]

    #顧客
     resources :customers, only: [:index, :show, :edit, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
