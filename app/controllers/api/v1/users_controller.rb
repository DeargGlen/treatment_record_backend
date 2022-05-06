module Api
  module V1
    class UsersController < ApplicationController
      #before_action :correct_user, only: [:edit, :update]
      #before_action :admin_user, only: :destroy

      def index
        @users = User.where(activated: true)

        render json: {
          users: users
        }, status: :ok
      end

      def show
        @user = User.find_by(id: params[:id])
        #user.activated?がfalseならrootにリダイレクトする
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: {
            user: @user
          }, status: :created
          # メールを確認してアカウントを有効化するようにflash
        else
          render json: {}, status: :internal_server_error
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: {
            user: @user
          }, status: :updated
        # プロフィールを編集しましたflash
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        User.find(params[:id]).destroy
        # flash[:success] = "ユーザーを削除しました"
        # redirect_to users_url
      end

      private
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

        def correct_user
          @user = User.find(params[:id])
          #redirect_to(root_url) unless current_user?(@user)
        end

        def admin_user
          #redirect_to(root_url) unless current_user.admin?
        end
    end
  end
end
