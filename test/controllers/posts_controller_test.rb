require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "test@example.com", password: "password", username: "testuser")
    sign_in @user
  end

  test "should get index" do
    get root_url
    assert_response :success
    assert_select "h1", text: "Home"
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: "Test post content" } }
    end

    assert_redirected_to root_url
    assert_equal "Test post content", @user.posts.last.body
  end

  test "should validate post body length" do
    long_content = "a" * 241
    assert_no_difference("Post.count") do
      post posts_url, params: { post: { body: long_content } }
    end

    assert_redirected_to root_url
    assert_not_empty flash[:post_errors]
  end

  test "should show post" do
    post = @user.posts.create!(body: "Test post")
    get post_url(post)
    assert_response :success
    assert_select "div", text: "Test post"
  end

  test "should delete own post" do
    post = @user.posts.create!(body: "Test post")

    assert_difference("Post.count", -1) do
      delete post_url(post)
    end

    assert_redirected_to root_url
  end

  test "should not delete other user post" do
    other_user = User.create!(email: "other@example.com", password: "password", username: "otheruser")
    other_post = other_user.posts.create!(body: "Other user post")

    assert_no_difference("Post.count") do
      delete post_url(other_post)
    end

    assert_response :not_found
  end

  test "should create repost" do
    original_post = @user.posts.create!(body: "Original post")

    assert_difference("Post.count") do
      post repost_post_path(original_post)
    end

    reposted_post = Post.order(created_at: :desc).first
    assert_equal original_post.id, reposted_post.post_id
  end
end
