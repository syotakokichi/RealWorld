class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header
    if token
      decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
      user_id = decoded_token.first['user_id']
      @current_user = User.find_by(id: user_id)
    end
    unless @current_user
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
end
