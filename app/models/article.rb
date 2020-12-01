class Article < ApplicationRecord

  # default_scope { order(created_at: :desc) }

  belongs_to :user

  validates_presence_of :user

  validates :title, presence: true

  mount_uploader :avatar, AvatarUploader

  has_rich_text :text

  def self.search(search)
    if search && search.length > 0
      select('articles.*, lower(articles.title)').
      joins("LEFT OUTER JOIN users ON users.id  = articles.user_id").
        where("lower(articles.title) LIKE ? OR lower(articles.text) LIKE ? OR lower(users.email) LIKE ?",
          "%#{search.downcase}%",
          "%#{search.downcase}%",
          "%#{search.downcase}%").
        distinct
    else
      where(nil)
    end
  end

end
