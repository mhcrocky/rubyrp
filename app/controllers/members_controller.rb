class MembersController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource :member, class: 'User'

  def index
    if current_user.has_role?(:superadmin)
      @users = User.with_role(:member).
                    order(:email).
                    search(filter).
                    paginate(page: params[:page], per_page: 12)
    else
      redirect_to authenticated_root_url, alert: 'You are not authorized to access this page.'
    end
  end

  private

  # def member_params
  #   params.require(:user).permit(:email, :password)
  # end

  def filter
    @filter = params[:q]
  end

end
