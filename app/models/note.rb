class Note < ApplicationRecord
  # belongs_to :user
  belongs_to :room

  has_rich_text :body
  broadcasts_to :room
end
