Rails.application.routes.draw do
    namespace 'api' do
      namespace 'v1' do
        resources :posts do
          resources :comments

          post "/register" => "users#create"
          post 'authenticate' => 'authentication#authenticate'
          get "index" => "users#index"
          get "show" => "users#show"
        end
      end
    end

end
