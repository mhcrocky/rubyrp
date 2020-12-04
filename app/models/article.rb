class Article < ApplicationRecord

  # default_scope { order(created_at: :desc) }

  belongs_to :user

  has_rich_text :text

  validates_presence_of :user

  validates :title, presence: true

  before_save :cleanup_embed

  def cleanup_embed
    if self.embed.present?
      if self.embed.include? 'embed' # Youtube + Google Maps (Not Vimeo)
        self.embed # Width + Height overridden by css
      else
        self.embed = nil
      end
    end
  end

  def self.search(search)
    if search && search.length > 0
      select('articles.*, lower(articles.title)').
      joins("LEFT OUTER JOIN users ON users.id = articles.user_id").
        where("lower(articles.title) LIKE ? OR lower(users.email) LIKE ?",
          "%#{search.downcase}%",
          "%#{search.downcase}%").
        distinct
    else
      where(nil)
    end
  end

end
