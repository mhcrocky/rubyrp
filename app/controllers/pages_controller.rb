class PagesController < ApplicationController
  # load_and_authorize_resource :user
  include Trackable

  def welcome
    @visits = Ahoy::Visit.where.not(longitude: nil)
                         .uniq{|v| v.longitude }

    ahoy.track "Viewed Welcome"
  end

  def dashboard
    @users = User.order(:email)
                 .search(filter)
                 .paginate(page: params[:page], per_page: 12)

    @article_titles = Article.order('created_at DESC')
                             .limit(900)

    @article_texts = Article.order('created_at DESC')
                            .limit(150)

    @comments = Comment.order('created_at DESC')
                       .limit(150)

    @rooms = Room.order('created_at DESC')
                 .limit(1500)

    @todo_items = TodoItem.order('created_at DESC')
                          .limit(1500)

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
