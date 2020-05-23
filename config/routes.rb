Rails.application.routes.draw do
    devise_for :admins
    root to: 'top#index' #トップランディングページ
    get 'lp' => 'top#lp'
    get 'recruitment' => 'top#recruitment'
    get 'temporary' => 'top#temporary'
    get 'company' => 'top#company'

    resources :pages
    resources :lists do
      collection do
        post :import
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/contact' => 'contact#index'
    post '/confirm' => 'contact#confirm'
    post '/thanks' => 'contact#thanks'
end
