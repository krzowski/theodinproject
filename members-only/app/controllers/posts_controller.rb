class PostsController < ApplicationController
  skip_before_action :authorize, only: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      @post.user_id = current_user.id
      @post.save
      redirect_to posts_path, notice: 'Post was successfully created.' 
    else
      render action: 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
