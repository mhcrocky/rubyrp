class PagesController < ApplicationController
  # load_and_authorize_resource :user

  def welcome
  end

  def dashboard
    @users = User.#accessible_by(current_ability).
                  order(:email).
                  search(filter).
                  paginate(page: params[:page], per_page: 12)
  end

  private

  def filter
    @filter = params[:q]
  end

end
