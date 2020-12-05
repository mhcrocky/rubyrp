class ChartsController < ApplicationController

  ## Users
  def month_of_year_users
    render json: User.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Articles
  def month_of_year_articles
    render json: Article.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Todo Items
  def complete_incomplete_todos
    render json: TodoItem.accessible_by(current_ability).group(:complete).count
  end
  def month_of_year_todos
    render json: TodoItem.accessible_by(current_ability).group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
