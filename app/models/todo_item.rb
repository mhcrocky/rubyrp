class TodoItem < ApplicationRecord
  # default_scope { order(created_at: :desc) }
  belongs_to :user
  validates_presence_of :user
  validates :title, presence: true
  visitable :ahoy_visit

  # Returns a string .. formatted TodoItem created_at field
  def created
    "#{self.created_at.in_time_zone("#{self.user.timezone}").strftime('%m/%d/%Y')}"
  end

  # Returns a string .. formatted TodoItem updated_at field
  def updated
    "#{self.updated_at.in_time_zone("#{self.user.timezone}").strftime('%m/%d/%Y')}" # .. %H, %M, %S
  end

  # Returns an array .. class method: number of todoItems month over year
  def self.month_of_year_todos
           group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
