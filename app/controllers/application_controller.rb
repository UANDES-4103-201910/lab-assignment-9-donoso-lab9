class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    render json: { session: session }
  end

  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def is_user_logged_in?
    logged_in = current_user
        if current_user then true else redirect_to root_path end
  end
  end
