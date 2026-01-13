class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates_uniqueness_of :username

  has_one_attached :profile_image

  validates :profile_image, content_type: { in: [ "image/jpeg", "image/png", "image/gif", "image/webp" ], message: "must be a valid image format" },
                     size: { less_than: 5.megabytes, message: "must be less than 5MB" }

  def admin?
    false # Override this method for admin users
  end
end
