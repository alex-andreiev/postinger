class RssfeedsController < ApplicationController
  before_action :set_rssfeed, only: [:show, :edit, :update, :destroy, :rss]

  def index
    @rssfeeds = Rssfeed.where(user_id: [current_user.id])
  end

  def show;end

  def new
    @rssfeed = Rssfeed.new
  end

  def edit;end

  def create
    @rssfeed = Rssfeed.new(rssfeed_params)
    @rssfeed.user_id = current_user.id
    if @rssfeed.save
      redirect_to @rssfeed, notice: 'RSS was successfully created.'
    else
      render :new
    end
  end

  def update
    if @rssfeed.update(rssfeed_params)
      redirect_to @rssfeed, notice: 'RSS was successfully updated.' 
    else
      render :edit, notice: 'RSS was successfully updated.'  
    end
  end

  def destroy
    @rssfeed.destroy
    redirect_to rssfeedfs_url, notice: 'RSS was successfully destroyed.'
  end

  def rss
    feeds = Feedjira::Feed.fetch_and_parse(@rssfeed.url)
    feeds.entries.each do |feed|
      @post = Post.new(user_id: current_user.id, title: feed.title, body: feed.summary)
      @post.save
    end
    redirect_to rssfeed_path, notice: 'Posts were successfully created.'
  end

  private

  def set_rssfeed
    @rssfeed = Rssfeed.find(params[:id])
  end

  def rssfeed_params
    params.require(:rssfeed).permit(:title, :url, :user_id)
  end
end
