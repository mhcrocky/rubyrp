class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.search(filter).
                  paginate(page: params[:page], per_page: 12)
  end

  private

  def filter
    @filter = params[:q]
  end

end
