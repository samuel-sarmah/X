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

  validate :profile_image_format
  validate :profile_image_size

  def admin?
    false # Override this method for admin users
  end

  private

  def profile_image_format
    return unless profile_image.attached?

    unless profile_image.content_type.in?([ "image/jpeg", "image/png", "image/gif", "image/webp" ])
      errors.add(:profile_image, "must be a valid image format")
    end
  end

  def profile_image_size
    return unless profile_image.attached?

    if profile_image.blob.byte_size > 5.megabytes
      errors.add(:profile_image, "must be less than 5MB")
    end
  end
end
