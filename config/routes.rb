Rails.application.routes.draw do
    devise_for :admins

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
