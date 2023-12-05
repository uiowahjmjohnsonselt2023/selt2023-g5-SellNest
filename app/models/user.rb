class User < ActiveRecord::Base
  has_one :cart, dependent: :destroy
  has_many :orders
  has_many :bookmarks, dependent: :destroy
  has_many :listings
  has_many :reviews
  after_create :create_cart_for_user

  def bookmarked?(listing)
    bookmarks.exists?(listing_id: listing.id)
  end

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def create_cart_for_user
    create_cart
  end
end
