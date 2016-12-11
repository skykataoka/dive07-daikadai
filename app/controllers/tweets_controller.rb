class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.save
    redirect_to tweets_path
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "つぶやきを更新しました!"
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])    
    @tweet.destroy
    redirect_to tweets_path, notice: "つぶやきを削除しました!"
  end
  
  private
  def tweets_params
    params.require(:tweet).permit(:contents)
  end
  
end
