class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_with_token!

  private
    def auth_token
      request.headers['Auth-Token']
    end

    def current_user
      @user
    end

    def authenticate_with_token!
      @user = APIToken.find_by(token: auth_token).try(:user)
      raise "Invalid token" if user.nil?
    end
end
