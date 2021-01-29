class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  ## /api/v1/articles/:article_id/comments (if "only: .." removed from routes)
  # def index
  #   @article = Article.find(params[:article_id])
  #   @comment = @article.comments
  #   render json: @comments
  # end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end

end
