
class UsersController < ApplicationController


      def new
        @user = User.new
        if logged_in?
          redirect_to home_path
        end
      end

      def create
        @user = User.new(user_params)
        if @user.save
          # session[:user_id] = @user.id
          log_in @user
          redirect_to home_path, :notice => "Thanks for signing up for pharmaTalk!"
        else
          flash[:danger] = "Failed to sign up!"
          redirect_to root_path
        end
      end

      private

        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

   
end
