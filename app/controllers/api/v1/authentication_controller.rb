module Api
    module V1
      class AuthenticationController < ApplicationController
        skip_before_action :authenticate_request

        def authenticate
          command = AuthenticateUser.call(params[:email], params[:password])
          if command.successful?
            render(json: {status: 'SUCCESS', message:'Authenticate success'})
            headers['Authorization'] = command.result
          else
            render(json: { error: command.errors }, status: :unauthorized)
          end
        end
      end
    end
end
