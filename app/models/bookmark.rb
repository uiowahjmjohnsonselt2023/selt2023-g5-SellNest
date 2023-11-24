class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :listable, polymorphic: true
end
