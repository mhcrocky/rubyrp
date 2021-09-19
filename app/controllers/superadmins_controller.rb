class SuperadminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :superadmin, class: 'User'

  def new
    if current_user.has_role?(:superadmin)
      @superadmin.add_role :superadmin
      @users = User.with_role(:superadmin)
                   .order(:email)
                   .search(filter)
                   .paginate(page: params[:page], per_page: 12)
    else
      redirect_to authenticated_root_url, alert: 'You are not authorized to access that page.'
    end
  end

  def create
    if current_user.has_role?(:superadmin)
      @superadmin.id = nil
      respond_to do |format|
        if @superadmin.save
          @superadmin.add_role :superadmin
          @superadmin.remove_role :visitor
          format.html { redirect_to @superadmin, notice: 'Super Administator was successfully created.' }
        else
          format.html { redirect_to request.referrer, alert: 'There was an error. Super Admin was not saved. Please make sure to use a valid and unique email, plus a valid password.' }
        end
      end
    else
      redirect_to authenticated_root_url, alert: 'You CANNOT create a superadmin.'
    end
  end

  private

  def superadmin_params
    params.require(:user).permit(:email, :password)
  end

  def filter
    @filter = params[:q]
  end

end
