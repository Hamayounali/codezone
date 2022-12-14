class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @likes = Post.find(params[:id]).likes
    @comments = Post.find(params[:id]).comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(comments_counter: 0, likes_counter: 0, author_id: current_user.id))
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to "/users/#{@post.user.id}", notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
