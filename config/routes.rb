Rails.application.routes.draw do
  #管理者アカウント
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }
  resources :admins, only: [:show]
  #使用者アカウント
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  #メンバーアカウント
  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions'
  }
  resources :members, only: [:show]

  root to: 'top#index' #トップページ
  #各種LPページ
  get 'guide' => 'top#guide' #企業側LP
  #特集
  get 'special' => 'top#special'
  get 'faq' => 'top#faq'
  get 'co' => 'top#co'

  #企業側アカウント
  get 'companies/pay' => 'companies#pay'

  resources :companies do
    collection do
      post :confirm
      post :thanks
    end
  end

  #記事一覧
  resources :posts
  #LPページ
  resources :lps
  #企業HP一覧
  resources :lists do
    collection do
      post :import
    end
  end
  resources :estimates do
    collection do
      post :confirm
      post :thanks
    end
  end
  #メッセージ
  get 'messages/sample' => 'messages#sample'
  #問い合わせフォーム
  get '/contact' => 'contact#index'
  post '/confirm' => 'contact#confirm'
  post '/thanks' => 'contact#thanks'
end
