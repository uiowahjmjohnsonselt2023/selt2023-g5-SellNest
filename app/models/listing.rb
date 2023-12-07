class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_tags, dependent: :destroy
  has_many :tags, through: :listing_tags
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews
  has_many_attached :photos

  scope :search_by_title, -> (query) { where('name LIKE ?', "%#{query}%")}
  scope :price_range, -> (min, max) { where(price: min..max) }
  scope :with_tags, -> (tags) { joins(:tags).where(tags: { name: tags }) }

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :is_sold, inclusion: { in: [true, false] }
end
