class Listing < ActiveRecord::Base


  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :cart_items
  # belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
