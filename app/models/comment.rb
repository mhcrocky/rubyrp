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

end
