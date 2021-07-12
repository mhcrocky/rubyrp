class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @articles = @articles.order('created_at DESC')
                         .search(filter)
                         .paginate(page: params[:page], per_page: 12)
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.where(user_id: @article.user.id)
                       .order('created_at DESC')
                       .paginate(page: params[:page], per_page: 3)
    @liked_article = UsersArticle.find_by(user: current_user, article: @article)
  end

  def new
  end

  def edit
  end

  def create
    @article.user = current_user #.id gives Fixnum instead of User
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_path(@article), notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    # if current_user likes the article .. avoid PG::ForeignKeyViolation
    user_article = UsersArticle.find_by(article: @article, user: current_user)
    if user_article.present?
      user_article.destroy
    end
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Article was successfully deleted.' }
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :text, :embed)
  end

  def filter
    @filter = params[:q]
  end

end
