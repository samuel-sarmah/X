require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "test@example.com", password: "password", username: "testuser")
    @other_user = User.create!(email: "other@example.com", password: "password", username: "otheruser")
    @post = @user.posts.create!(body: "Test post")
  end

  test "like can be created" do
    like = Like.new(user: @other_user, post: @post)
    assert like.save
  end

  test "like belongs to user" do
    like = Like.create!(user: @other_user, post: @post)
    assert_equal @other_user, like.user
  end

  test "like belongs to post" do
    like = Like.create!(user: @other_user, post: @post)
    assert_equal @post, like.post
  end

  test "user cannot like same post twice" do
    Like.create!(user: @other_user, post: @post)
    duplicate_like = Like.new(user: @other_user, post: @post)
    assert_not duplicate_like.save
  end

  test "post can count its likes" do
    Like.create!(user: @other_user, post: @post)
    assert_equal 1, @post.likes.count
  end
end
