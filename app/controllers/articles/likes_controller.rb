class Articles::LikesController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    # @liked_article = UsersArticle.find_by(user: current_user, article: article)
    current_user.users_articles.create(article: article)
    # redirect_to article, notice: "Article liked"
    respond_to do |format|
      # if article.save
        format.js
      # end
    end
  end

  def destroy
    # article = article.find(params[:article_id])
    # current_user.users_articles.find_by(article: article).destroy!
    # redirect_to article, notice: "Article unliked"

    users_article = UsersArticle.find(params[:id])
    users_article.destroy
    # redirect_to article_path(users_article.article_id), notice: "Article unliked"
    respond_to do |format|
      format.js
    end

    # # users_article = GlobalID::Locator.locate(params[:id])
    # users_article = GlobalID::Locator.locate_signed(params[:id])
    # users_article.destroy
    # redirect_to article_path(users_article.article_id), notice: "Article unliked"
  end
end
