module Api
    module V1
      class UsersController < ApplicationController
        skip_before_action :authenticate_request

        def create
          user = User.create(user_params)
            if user.save
            render json: {status: 'SUCCESS', message: 'Created new user' , data: user}, status: :ok
            else
              render json: {status: 'ERROR', message: 'User not created' , data: user.errors}, status: :unprocessable_entity
            end
        end

        private

        def user_params
          params.permit(:email, :password)
        end
      end
    end
end
