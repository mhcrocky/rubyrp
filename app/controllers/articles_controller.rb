class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.search(filter).
                        paginate(page: params[:page], per_page: 12)
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.search(filter).
                        where(user_id:current_user.id).
                        paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
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
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Article was successfully deleted.' }
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :text, :avatar, :avatar_cache, :remove_avatar)
  end

  def filter
    @filter = params[:q]
  end

end
