class WebController < ApplicationController
  def index
    redirect_to maneys_path if user_signed_in?
  end
end
