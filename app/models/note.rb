class Note < ApplicationRecord
  default_scope {
    order(created_at: :desc).
    limit(10000)
  }

  has_rich_text :body

  validates_length_of :body, maximum: 10000

  belongs_to :user
  belongs_to :room

  validates_presence_of :user
  validates_presence_of :room

  validates :body, presence: true

  broadcasts_to :room, inserts_by: :prepend

  # Returns only notes created in the past 24 hours
  scope :daily, -> {
    where("created_at > ?", 1.day.ago)
  }

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

  # Returns a string .. strip out unknown characters, etc.. for text in word tree
  def strip_body_for_tree
    self.body
        .to_plain_text
        .downcase
        .gsub(/[^a-z0-9\s]/i, ' ')
        .gsub(/[^0-9A-Za-z]/, ' ')
        .gsub(/and|are|but|can|from|has|have|had|too|the|there|very|way|where|who/, ' ')
  end

end
