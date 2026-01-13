require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "test@example.com", password: "password", username: "testuser")
    @other_user = User.create!(email: "other@example.com", password: "password", username: "otheruser")
    @post = @user.posts.create!(body: "Test post")
    sign_in @other_user
  end

  test "should create like" do
    assert_difference("Like.count") do
      post post_likes_path(@post)
    end

    assert_redirected_to post_url(@post)
    assert_equal 1, @post.likes.count
  end

  test "should destroy like" do
    like = Like.create!(user: @other_user, post: @post)

    assert_difference("Like.count", -1) do
      delete post_like_path(@post, like)
    end

    assert_redirected_to post_url(@post)
    assert_equal 0, @post.likes.count
  end

  test "requires authentication" do
    sign_out @other_user

    post post_likes_path(@post)
    assert_redirected_to new_user_session_path
  end

  test "prevents duplicate likes" do
    Like.create!(user: @other_user, post: @post)

    assert_no_difference("Like.count") do
      post post_likes_path(@post)
    end
  end
end
