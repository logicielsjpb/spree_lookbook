Spree::Core::Engine.add_routes do
  get '/inspirez-vous', to: 'lookbooks#show'
  get '/inspirez-vous/:slug', to: 'lookbooks#show', as: :show_lookbook
  get '/inspirez-vous/:slug/:kit', to: 'lookbooks#show', as: :show_kit


  namespace :admin do
    get '/kits/add_product/', to: 'kits#add_product'
    get '/lookbooks/kits/add_product/', to: 'lookbooks/kits#add_product'
    get '/lookbooks/add_kit/', to: 'lookbooks#add_kit'



    concern :positionable do
      collection do
        post :update_positions
      end
    end

    resources :kits    do
      collection do
        get :search
      end
    end

    resources :lookbooks, concerns: :positionable do
      resources :kits, concerns: :positionable, controller: "lookbooks/kits" do
        post "update_product_position", to: "lookbooks/kits#update_product_positions", as: :update_product_position
      end
      post "edit", to: "lookbooks#edit order"
    end



  end
end
