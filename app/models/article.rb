class Article < ApplicationRecord

  # default_scope { order(created_at: :desc) }

  has_rich_text :text

  validates_length_of :text, maximum: 25000

  belongs_to :user

  validates_presence_of :user

  has_many :users_articles
  has_many :liked_by_users, through: :users_articles, source: :user, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :title, presence: true

  visitable :ahoy_visit

  before_save :iframe, :thumb

  # Returns only articles created in the past 24 hours
  scope :daily, -> {
    where("created_at > ?", 1.day.ago)
  }

  # Returns a string .. Aricle title
  def name
    self.title
  end

  # Returns a string .. formatted Aricle created_at field
  def created
    if self.created_at > 1.day.ago
      "Today"
    elsif self.created_at > 1.week.ago
      "#{ActionController::Base.helpers.distance_of_time_in_words Time.now.to_date, self.created_at} ago"
    else
      "#{self.created_at.strftime('%b %-d, %Y')}"
    end
  end

  # Returns a string .. formatted Aricle updated_at field
  def updated
    if self.updated_at > 1.day.ago
      "Today"
    elsif self.updated_at > 1.week.ago
      "#{ActionController::Base.helpers.distance_of_time_in_words Time.now.to_date, self.updated_at} ago"
    else
      "#{self.updated_at.strftime('%b %-d, %Y')}"
    end
  end

  #show (before_save)
  # Returns a string (html_safe) .. iframe element from the embed string field
  def iframe
    if self.embed.present?
      ### YouTube
      ## Browser link --- use array to handle most playlist links, etc
      if self.embed =~ /^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=/  # self.embed.include? 'https://www.youtube.com/watch?v='
        ("<iframe src='https://www.youtube.com/embed/#{self.embed[32..42]}' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>").html_safe
      ## YouTube share link --- using array, because .split('https://youtu.be/').last wouldn't handle start at option ()?t=12)
      elsif self.embed =~ /^(https?:\/\/)?(www\.)?youtu.be\//  # self.embed.include? 'https://youtu.be/'
        ("<iframe src='https://www.youtube.com/embed/#{self.embed[17..27]}' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>").html_safe
      ### Validate + Generate iframe for whatever other embeds you want to allow (Google Maps, Vimeo, etc)
      # elsif
      else
        self.embed = nil
      end
    end
  end

  #_articles (before_save)
  # Returns a string (html_safe) .. img element from the embed string field
  def thumb
    if self.embed.present?
      ### YouTube
      ## Each YouTube video has 4 generated images [ /0 .. /3 ]
      if self.embed =~ /^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=/
        ("<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/#{self.embed[32..42]}/0.jpg' />").html_safe
      elsif self.embed =~ /^(https?:\/\/)?(www\.)?youtu.be\//
        ("<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/#{self.embed[17..27]}/0.jpg' />").html_safe
      else
        self.embed = nil
      end
    end
  end

  # Returns a string .. strip out unknown characters, etc.. for text in word tree
  def strip_text_for_tree
    self.text
        .to_plain_text
        .downcase
        .gsub(/[^a-z0-9\s]/i, ' ')
        .gsub(/[^0-9A-Za-z]/, ' ')
        .gsub(/and|are|but|can|from|has|have|had|too|the|there|very|way|where|who/, ' ')
  end

  # Returns a string .. strip out unknown characters, etc.. for title in word tree
  def strip_title_for_tree
    self.title
        .downcase
        .gsub(/[^a-z0-9\s]/i, ' ')
        .gsub(/[^0-9A-Za-z]/, ' ')
        .gsub(/and|are|but|can|from|has|have|had|too|the|there|very|way|where|who/, ' ')
  end

  # Search
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

  # Returns an array .. class method: number of articles month over year
  def self.month_of_year_articles
           group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
