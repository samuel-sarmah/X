require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@example.com", password: "password", username: "testuser")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be unique" do
    @user.save
    duplicate_user = User.new(email: "other@example.com", password: "password", username: "testuser")
    assert_not duplicate_user.valid?
  end

  test "email should be unique" do
    @user.save
    duplicate_user = User.new(email: "test@example.com", password: "password", username: "otheruser")
    assert_not duplicate_user.valid?
  end

  test "should have many posts" do
    assert_respond_to @user, :posts
  end

  test "should have many comments" do
    assert_respond_to @user, :comments
  end

  test "should have many likes" do
    assert_respond_to @user, :likes
  end

  test "should have attached profile image" do
    assert_respond_to @user, :profile_image
  end

  test "should validate profile image content type" do
    @user.profile_image.attach(
      io: StringIO.new("fake image content"),
      filename: "test.txt",
      content_type: "text/plain"
    )
    assert_not @user.valid?
  end

  test "admin? method returns false by default" do
    assert_not @user.admin?
  end
end
