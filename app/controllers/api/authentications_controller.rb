module API
  class AuthenticationsController < ApplicationController

    def sign_in
      user = User.find_by(email: params[:email])

      if user && user.password == params[:password]
        render json: {done: true}, status: :ok
      else
        render json: {errors: ["errors"]}, status: :not_found
      end
    end

    def sign_up
      user = User.new(user_params)
      user.password = params[:password]
      user.save!

      render json: {done: true}, status: :ok
    end

    private
      def user_params
        params.require(:user).permit!(:email)
      end
  end
end
