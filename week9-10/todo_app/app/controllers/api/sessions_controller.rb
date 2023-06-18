module Api
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      user = User.find_by(email: params[:user][:email])
      if user&.authenticate(params[:user][:password])
        token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
        render json: { user: { email: user.email, token: token } }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
end
