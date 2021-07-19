class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @article      = Article.find(params[:article_id])
    @comment      = @article.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js
      # else
      #   format.html { redirect_to article_path(@article), notice: 'Comment was NOT created.' }
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end

end
