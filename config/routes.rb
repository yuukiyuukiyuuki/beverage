Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #ゲスト
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  #顧客部分
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    #ドリンク
    resources :drinks do
      #コメント
      resources :drink_comments, only: [:create,:destroy]
        #いいね
        resource :favorites, only: [:create, :destroy]
    end

    # メッセージ
    resources :messages, only: [:create]

    # ルーム
    resources :rooms, only: [:create,:show]

    #顧客
    resources :customers, only: [:index, :show, :edit, :update] do
      member do
        get :favorites
      end

      #フォロー、フォロワー
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end

    #検索
    get "search" => "searches#search"

  end

  #管理者部分
  namespace :admin do

    #商品
    resources :drinks, only: [:index, :show, :destroy]

    #顧客
    resources :customers, only: [:index, :show, :edit] do
      collection do
        #退会確認画面
        get 'confirm_withdraw'
        #退会処理
        patch 'withdraw'
     end
    end

    #検索
    get "search" => "searches#search"

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
