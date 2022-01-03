class MembersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :member, class: 'User'

  def new
    if current_user.has_role?(:superadmin)
      @member.add_role :member
      @users = User.with_role(:member)
                   .order(:email)
                   .search(filter)
                   .paginate(page: params[:page], per_page: 12)
    else
      redirect_to authenticated_root_url, alert: 'You are not authorized to access that page.'
    end
  end

  def create
    if current_user.has_role?(:superadmin)
      @member.id = nil
      respond_to do |format|
        if @member.save
          @member.add_role :member
          @member.remove_role :visitor
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
        else
          format.html { redirect_to request.referrer, alert: 'There was an error. Member was not saved. Please make sure to use a valid and unique email, plus a valid password.' }
        end
      end
    else
      redirect_to authenticated_root_url, alert: 'You CANNOT create a member.'
    end
  end

  private

  def member_params
    params.require(:user).permit(:email, :password)
  end

  def filter
    @filter = params[:q]
  end

end
