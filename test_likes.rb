# Simple test runner for Likes
require 'test_helper'

puts "Testing Like model..."

user = User.create!(email: "test@example.com", password: "password", username: "testuser")
post = user.posts.create!(body: "Test post")

# Test like creation
like = Like.new(user: user, post: post)
if like.save
  puts "✓ Like creation works"
else
  puts "✗ Like creation failed: #{like.errors.full_messages.join(', ')}"
end

# Test uniqueness
like2 = Like.new(user: user, post: post)
if !like2.save
  puts "✓ Like uniqueness works"
else
  puts "✗ Like uniqueness failed"
end

# Test post likes count
puts "Post likes count: #{post.likes.count}"
if post.likes.count == 1
  puts "✓ Post likes count works"
else
  puts "✗ Post likes count failed"
end

puts "Testing completed!"
