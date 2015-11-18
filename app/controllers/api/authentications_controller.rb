module API
  class AuthenticationsController < ApplicationController

    def sign_in
      user = User.find_by(email: params[:email])

      if user && user.password == params[:password]
        render json: {a: "b"}, status: :ok
      else
        render json: {e: "b"}, status: :not_found
      end
    end
  end
end
