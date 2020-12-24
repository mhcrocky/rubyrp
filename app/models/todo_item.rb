class TodoItem < ApplicationRecord
  # default_scope { order(created_at: :desc) }
  belongs_to :user
  validates_presence_of :user
  validates :title, presence: true

  def created
    "#{self.created_at.strftime('%m.%d.%Y')}"
  end
  def finished
    "#{self.updated_at.strftime('%m.%d.%Y')}"
  end

end
