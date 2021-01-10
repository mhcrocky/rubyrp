class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # default_scope { order(created_at: :desc) }

  has_many :todo_items, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :rooms, dependent: :destroy

  after_create :assign_default_role, :first_items

  def assign_default_role
    self.add_role(:visitor)
  end

  def first_items
    2.times do |i|
      self.todo_items.create(title: "Item #{i+1} for #{self.email}", complete: i % 3 == 0 ? true : false)
    end
  end

  def name
    "#{self.email.split('@').first}"
  end

  def self.search(search)
    if search && search.length > 0
      where("lower(email) LIKE ?", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

end
