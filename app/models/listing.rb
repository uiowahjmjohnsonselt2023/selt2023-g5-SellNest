class Listing < ActiveRecord::Base
  belongs_to :user
  # has_many_attached :photos
end
