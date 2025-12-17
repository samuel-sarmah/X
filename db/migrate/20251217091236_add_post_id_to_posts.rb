class AddPostIdToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :post_id, :integer
  end
end
