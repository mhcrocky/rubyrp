class ChartsController < ApplicationController

  ## Users
  # def dev_users
  #   render json: User.group_by_day(:created_at, time_zone: "Eastern Time (US & Canada)").count
  # end
  def month_of_year_users
    render json: User.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Articles
  # def dev_articles
  #   render json: Article.group_by_day(:created_at, time_zone: "Eastern Time (US & Canada)").count
  # end
  def month_of_year_articles
    render json: Article.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  ## Todo Items
  # def dev_todos
  #   render json: Article.group_by_day(:created_at, time_zone: "Eastern Time (US & Canada)").count
  # end
  def month_of_year_todos
    render json: TodoItem.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end
  def month_of_year_single_todos
    render json: current_user.todo_items.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
