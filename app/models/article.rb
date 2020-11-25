class Article < ApplicationRecord

  has_rich_text :text

  default_scope { order(created_at: :desc) }

  belongs_to :user

  validates :title, presence: true

  mount_uploader :avatar, AvatarUploader

  def self.search(search)
    if search && search.length > 0
      where("lower(title) LIKE ? OR lower(text) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

end
