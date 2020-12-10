class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role?(:sysadmin) || current_user.has_role?(:superadmin)
      @users = User.with_role(:visitor).
                    order(:email).
                    search(filter).
                    paginate(page: params[:page], per_page: 12)
    else
      redirect_to authenticated_root_url, alert: 'You are not authorized to access this page.'
    end
  end

  private

  def filter
    @filter = params[:q]
  end

end
