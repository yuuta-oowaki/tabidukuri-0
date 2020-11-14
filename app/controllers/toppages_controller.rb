class ToppagesController < ApplicationController
  def index
    if logged_in?
      @plans = current_user.plans.order(:id).page(params[:page])
    end
  end
end
