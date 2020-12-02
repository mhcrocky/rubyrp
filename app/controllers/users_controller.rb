class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).
                        paginate(page: params[:page], per_page: 12)
  end

end
