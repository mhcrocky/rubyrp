class Article < ApplicationRecord

  # default_scope { order(created_at: :desc) }

  has_rich_text :text

  belongs_to :user

  validates_presence_of :user

  has_many :users_articles
  has_many :liked_by_users, through: :users_articles, source: :user, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :title, presence: true

  before_save :iframe
  before_save :thumb

  #show
  def iframe
    if self.embed.present?
      ### YouTube
      ## Browser link --- use array to handle most playlist links, etc
      if self.embed =~ /^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=/  # self.embed.include? 'https://www.youtube.com/watch?v='
        "<iframe src='https://www.youtube.com/embed/#{self.embed[32..42]}' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
      ## YouTube share link --- using array, because .split('https://youtu.be/').last wouldn't handle start at option ()?t=12)
      elsif self.embed =~ /^(https?:\/\/)?(www\.)?youtu.be\//  # self.embed.include? 'https://youtu.be/'
        "<iframe src='https://www.youtube.com/embed/#{self.embed[17..27]}' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
      ### Validate + Generate iframe for whatever other embeds you want to allow (Google Maps, Vimeo, etc)
      # elsif
      else
        self.embed = nil
      end
    end
  end

  #_articles
  def thumb
    if self.embed.present?
      ### YouTube
      ## Each YouTube video has 4 generated images [ /0 .. /3 ]
      if self.embed =~ /^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=/
        "<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/#{self.embed[32..42]}/0.jpg' />"
      elsif self.embed =~ /^(https?:\/\/)?(www\.)?youtu.be\//
        "<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/#{self.embed[17..27]}/0.jpg' />"
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
