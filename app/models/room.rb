class Room < ApplicationRecord

  belongs_to :user

  validates_presence_of :user

  validates :name, presence: true

  def self.search(search)
    if search && search.length > 0
      where("lower(name) LIKE ?", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

end
