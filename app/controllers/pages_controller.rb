class PagesController < ApplicationController

  def welcome
  end

  def dashboard
    @users = User.order(:email).
                  search(filter).
                  paginate(page: params[:page], per_page: 14)
  end

  private

  def filter
    @filter = params[:q]
  end

end
