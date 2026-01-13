class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.new(user: current_user)

    respond_to do |format|
      if @like.save
        format.turbo_stream { render turbo_stream: turbo_stream.update("post-likes-#{@post.id}", partial: "posts/likes", locals: { post: @post }) }
      else
        format.html { redirect_back fallback_location: root_path, alert: "Could not like post!" }
      end
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like&.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update("post-likes-#{@post.id}", partial: "posts/likes", locals: { post: @post }) }
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
