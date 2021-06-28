Rails.application.routes.draw do
    namespace 'api' do
      namespace 'v1' do
        resources :posts do
          resources :comments
          post 'register' => 'users#create'
          post 'authenticate' => 'authentication#authenticate'
        end
      end
    end

end
