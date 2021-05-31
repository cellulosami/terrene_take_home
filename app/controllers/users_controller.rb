class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      
      json_response(response, :created)
    end

    def show
      if @current_user.id == params[:id].to_i
        user = User.find(params[:id])
        response = {
          name: user.name,
          email: user.email,
          id: user.id,
          created_at: user.created_at,
          updated_at: user.updated_at,
        }
      else
        response = { message: Message.unauthorized }
      end
      
      json_response(response)
    end
  
    private
  
    def user_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end