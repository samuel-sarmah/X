class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :post, optional: true # means a post can be created without another post association.

  validates :body, length: { maximum: 240 }, allow_blank: true
  validates :body, presence: true, unless: :post_id?

  def post_type
    if post_id? && body?
      "quote-post"
    elsif post_id?
      "repost"
    else
      "post"
    end
  end
end
