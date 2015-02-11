class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(micropost_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      # @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    flash[:success] = "You have deleted your post."
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:post).permit(:title, :content)
    end
end
