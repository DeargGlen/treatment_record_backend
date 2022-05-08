class ApplicationController < ActionController::API
  before_action :set_current_user
  before_action :fake_load

  def fake_load
    sleep(0)
  end

  include SessionsHelper
  def set_current_user
      @current_user = User.find_by(id: session[:user_id])
  end
end
