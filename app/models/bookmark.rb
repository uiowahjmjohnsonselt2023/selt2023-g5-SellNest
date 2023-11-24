class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :listable, polymorphic: true
end
