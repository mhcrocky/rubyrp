class Note < ApplicationRecord
  # belongs_to :user
  belongs_to :room

  has_rich_text :body
  broadcasts_to :room, inserts_by: :prepend

  default_scope { order(created_at: :desc) }

  # Returns a string .. formatted Note created_at field
  def created
    if self.created_at > 1.day.ago
      "Today"
    elsif self.created_at > 1.week.ago
      "#{ActionController::Base.helpers.distance_of_time_in_words Time.now.to_date, self.created_at} ago"
    else
      "#{self.created_at.strftime('%b %-d, %Y')}"
    end
  end

end
