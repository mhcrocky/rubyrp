class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    render json: @articles.order('created_at DESC')
  end

  def show
    render json: Article.find(params[:id])
  end

  def create
    @article.user = current_user #.id gives Fixnum instead of User
    respond_to do |format|
      if @article.save
        format.json { render json: @article, status: :created }
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.json { render json: @article, status: :ok }
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def article_params
      params.require(:article).permit(:user_id, :title, :text, :embed)
    end

end
