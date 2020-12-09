class AdminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :admin, class: 'User'

  def create
    @admin.id = nil
    respond_to do |format|
      if @admin.save
        @admin.add_role :admin
        format.html { redirect_to authenticated_root_url, notice: 'Administator was successfully created.' }
      else
        format.html { redirect_to authenticated_root_url, notice: 'Administator was NOT successfully created.' }
      end
    end
  end

  private

  def admin_params
    params.require(:user).permit(:email, :password)
  end

end
