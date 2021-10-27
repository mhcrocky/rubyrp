class Articles::LikesController < ApplicationController

  def create
    article = Article.find(params[:article_id])

    current_user.users_articles.create(article: article)

    # render partial: 'articles/like'
    redirect_to article
  end

  def destroy
    users_article = UsersArticle.find(params[:id])
    users_article.destroy

    redirect_to article_path(users_article.article_id)

    # # users_article = GlobalID::Locator.locate(params[:id])
    # users_article = GlobalID::Locator.locate_signed(params[:id])
    # users_article.destroy
    # redirect_to article_path(users_article.article_id), notice: "Article unliked"
  end
end
