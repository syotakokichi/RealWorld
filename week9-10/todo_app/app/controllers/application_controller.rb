class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
    @current_user = User.find(decoded_token[0]['user_id'])
  rescue
    render json: { error: 'Not Authenticated' }, status: :unauthorized
  end
end
