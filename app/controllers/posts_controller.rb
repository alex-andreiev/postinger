class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(user_id: [current_user.id]).paginate(:page => params[:page], :per_page => 10)
  end

  def show;end

  def new
    @post = Post.new
  end

  def edit;end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def send_tweet
    current_user.twitter.update(message[0...140])
    redirect_to :back, notice: 'Post was seccussefully send to twitter'
  end

  def message
    params[:body].inspect.to_s.gsub!(/<[a-zA-Z\/][^>]*>/,"").to_s
  end

  def send_vk
    current_user.vk.wall.post(message: message)
    redirect_to :back, notice: 'Post was seccussefully send to vk'
  end

  def send_fb
    current_user.facebook.put_wall_post(message)
    redirect_to :back, notice: 'Post was seccussefully send to Facebook'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
