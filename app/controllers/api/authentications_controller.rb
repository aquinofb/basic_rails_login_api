module API
  class AuthenticationsController < ApplicationController

    def sign_in
      user = User.find_by(email: params[:email])

      if user && user.password == params[:password]
        api_token = user.api_tokens.create!
        render json: {email: user.email, auth_token: api_token.token}, status: :ok
      else
        render json: {errors: ["Invalid user or password"]}, status: :forbidden
      end
    end

    def sign_up
      user = User.new(user_params)
      user.password = params[:authentication][:password]

      if user.save
        render json: user, status: :ok
      else
        render json: {errors: user.errors}, status: :forbidden
      end
    end

    private
      def user_params
        params.require(:authentication).permit(:email)
      end
  end
end
