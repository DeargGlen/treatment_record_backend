class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false
  before_action :fake_load

  def fake_load
    sleep(0)
  end

  private 
    def logged_in?
        !current_api_v1_user.nil?
    end

    def logged_in_only
      if logged_in?
        message = "You need to login."
        render json: current_api_v1_user
      end
    end

end
