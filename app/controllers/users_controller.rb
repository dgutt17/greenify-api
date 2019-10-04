class UsersController < ApplicationController
    skip_before_action :authenticate_request, [:authenticate]

    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])
        
        if command.success?
            render json: {auth_token: command.result}, status: 200
        else
            render json: {error: command.errors }, status: :unauthorized
        end
    end

end
