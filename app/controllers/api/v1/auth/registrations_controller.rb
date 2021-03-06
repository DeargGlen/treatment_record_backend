class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_v1_user!
  private

    def sign_up_params
      params.permit(:email, :password, :password_confirmation, :name)
    end

    def account_update_params
      params.permit(:email, :password, :password_confirmation, :name)
    end
end
