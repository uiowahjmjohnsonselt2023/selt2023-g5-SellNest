class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
end
