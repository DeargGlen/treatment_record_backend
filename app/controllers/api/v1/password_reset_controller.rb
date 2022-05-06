module Api
  module V1
    class PasswordResetsController < ApplicationController
      before_action :get_user, only: [:edit, :update]
      before_action :valid_user, only: [:edit, :update]
      before_action :check_expiration, only: [:edit, :update]

      def create
        @user = User.find_by(email: params[:password_reset][:email].downcase)
        if @user
          @user.create_reset_digest
          @user.send_password_reset_email
          #flash[:info] = "パスワード再設定用のメールが送信されました"
          #redirect_to root_url
        else
          #flash.now[:danger] = "該当するメールアドレスがありません"
          #render 'new'
        end
      end

      def update
        if params[:user][:password].empty?
          @user.errors.add(:password, :blank)
          #render 'edit'
        elsif @user.update(user_params)
          log_in @user
          @user.update_attribute(:reset_digest, nil)
          #flash[:success] = "パスワードがリセットされました"
          #redirect_to @user
        else
          #render 'edit'
        end
      end


      private

        def user_params
          params.require(:user).permit(:password, :password_confirmation)
        end
        
        def get_user
          @user = User.find_by(email: params[:email])
        end

        def valid_user
          unless (@user && @user.activated? &&  @user.authenticated?(:reset, params[:id]))
            #redirect_to root_url
          end
        end

        def check_expiration
          if @user.password_reset_expired?
            #flash[:danger] = "パスワードリセット用のリンクが期限切れです#{@user.reset_sent_at}"
            #redirect_to new_password_reset_url
          end
        end
    end
  end
end
