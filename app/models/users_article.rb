class UsersArticle < ApplicationRecord
  belongs_to :user
  belongs_to :article

  # Returns only likes created in the past week
  scope :this_week, -> {
    where("created_at > ?", 1.week.ago)
  }

  # Returns an array .. class method: number of article likes month over year
  def self.month_of_year_article_likes
           group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns a hash .. class method: 10 most liked articles
  def self.top_ten_article_likes
           group(:article_id)
          .limit(10)
          .count
  end

end
