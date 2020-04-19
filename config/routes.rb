Rails.application.routes.draw do
  devise_for :admins
    #devise_for :admins 管理者
    #devise_for :users ユーザー
    #devise_for :owners　オーナー

    root to: 'stores#index'
    resources :stores do
      collection do
        post :import
      end
    end

    get 'contact' => 'contact#index'
    post 'confirm' =>'contact#confirm'
    post 'thanks' => 'contact#thanks'

end
