class PagesController < ApplicationController
  # load_and_authorize_resource :user

  def welcome
  end

  def dashboard
    @users = User.order(:email)
                 .search(filter)
                 .paginate(page: params[:page], per_page: 12)
  end

  def terms_and_conditions
  end

  def privacy_policy
  end

  def sitemap
  end

  private

  def filter
    @filter = params[:q]
  end

end
