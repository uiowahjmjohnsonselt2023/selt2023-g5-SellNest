class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :listable, polymorphic: true
end

# User needs to
# has_many :bookmarks

# Listing needs to
# has_many :bookmarks, as: :listable
