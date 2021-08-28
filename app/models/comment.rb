class Comment < ApplicationRecord

  default_scope {
    order(created_at: :desc).
    limit(120)
  }

  has_rich_text :body

  belongs_to :user
  belongs_to :article

  validates_presence_of :user
  validates_presence_of :article

  validates :body, presence: true

  # Returns only comments created in the past 24 hours
  scope :daily, -> {
    where("created_at > ?", 1.day.ago)
  }

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
