class VisitorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :visitor, class: 'User'

  def new
    if current_user.has_role?(:superadmin)
      @visitor.add_role :visitor
      @users = User.with_role(:visitor)
                   .order(:email)
                   .search(filter)
                   .paginate(page: params[:page], per_page: 12)
    else
      redirect_to authenticated_root_url, alert: 'You are not authorized to access that page.'
    end
  end

  def create
    if current_user.has_role?(:superadmin)
      @visitor.id = nil
      respond_to do |format|
        # add_role visitor at model level (assign_default_role)
        if @visitor.save
          format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        else
          format.html { redirect_to request.referrer, alert: 'There was an error. Visitor was not saved. Please make sure to use a valid and unique email, plus a valid password.' }
        end
      end
    else
      redirect_to authenticated_root_url, alert: 'You CANNOT create a visitor.'
    end
  end

  private

  def visitor_params
    params.require(:user).permit(:email, :password)
  end

  def filter
    @filter = params[:q]
  end

end
