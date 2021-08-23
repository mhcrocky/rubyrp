class PagesController < ApplicationController
  # load_and_authorize_resource :user
  include Trackable

  def welcome
    ahoy.track "Viewed Welcome"
  end

  def dashboard
    @users = User.order(:email)
                 .search(filter)
                 .paginate(page: params[:page], per_page: 12)

    @visits = Ahoy::Visit.where.not(longitude: nil)
                         .uniq{|v| v.longitude }

    @articles = Article.all

    @comments = Comment.all

    @rooms = Room.all

    @todo_items = TodoItem.all

    ahoy.track "Viewed Dashboard"
  end

  def terms_and_conditions
    ahoy.track "Viewed Terms and Conditions"
  end

  def privacy_policy
    ahoy.track "Viewed Privacy Policy"
  end

  def cookie_policy
    ahoy.track "Viewed Cookie Policy"
  end

  def sitemap
    ahoy.track "Viewed Sitemap"
  end

  private

  def filter
    @filter = params[:q]
  end

end
