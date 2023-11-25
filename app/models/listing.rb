class Listing < ActiveRecord::Base
  # belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
