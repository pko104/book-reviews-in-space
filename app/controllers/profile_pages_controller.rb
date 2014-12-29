class ProfilePagesController < ApplicationController
  helpers do
    def current_user
      user_id = session[:user_id]
      @current_user ||= User.find(user_id) if user_id.present?
    end

    def signed_in?
      current_user.present?
    end
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def astronaut
    current_user.astronaut = true
  end

  def candidate
    current_user.astronaut = false
  end

  def index
  end

  def show
  end

end
