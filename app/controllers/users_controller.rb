class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).
                        order('created_at DESC').
                        paginate(page: params[:page], per_page: 12)
  end

  def destroy
    if current_user.has_role?(:sysadmin) || current_user.has_role?(:superadmin)
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to authenticated_root_url, notice: 'User was successfully deleted.' }
      end
    else
      redirect_to authenticated_root_url, alert: 'You CANNOT delete a user other than yourself.'
    end
  end

end
