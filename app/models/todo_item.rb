class TodoItem < ApplicationRecord
  # default_scope { order(created_at: :desc) }
  belongs_to :user
  validates_presence_of :user
  validates :title, presence: true
  visitable :ahoy_visit

  # Return a string .. formatted TodoItem created_at field
  def created
    "#{self.created_at.in_time_zone("#{self.user.timezone}").strftime('%m/%d/%Y')}"
  end

  # Return a string .. formatted TodoItem updated_at field
  def updated
    "#{self.updated_at.in_time_zone("#{self.user.timezone}").strftime('%m/%d/%Y')}" # .. %H, %M, %S
  end

end
