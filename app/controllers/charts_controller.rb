class ChartsController < ApplicationController

  ## Users
  def month_of_year_users
    render json: User.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Articles
  def month_of_year_articles
    render json: Article.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Todo Items
  def complete_incomplete_todos
    render json: TodoItem.group(:complete).count
  end
  def complete_incomplete_single_todos
    render json: current_user.todo_items.group(:complete).count
  end
  def month_of_year_todos
    render json: TodoItem.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
  def month_of_year_single_todos
    render json: current_user.todo_items.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
