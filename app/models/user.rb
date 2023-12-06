class User < ActiveRecord::Base
  has_one :cart, dependent: :destroy
  has_many :orders
  has_many :bookmarks, dependent: :destroy
  has_many :listings
  has_many :reviews
  after_create :create_cart_for_user
  validates :seller, inclusion: { in: [true, false] }

  def bookmarked?(listing)
    bookmarks.exists?(listing_id: listing.id)
  end

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
      u.full_name = auth.info.name # assuming the user model has a name
      u.avatar_url = auth.info.image # assuming the user model has an image
    end

    if user.new_record?
      if user.save
        user
      else
        Rails.logger.warn "User could not be created: #{user.errors.full_messages.join(', ')}"
        nil # Or return the user with errors if you want to show these to the user
      end
    else
      user
    end
  end


  private

  def create_cart_for_user
    create_cart
  end
end
