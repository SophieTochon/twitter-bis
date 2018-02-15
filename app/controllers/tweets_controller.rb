class TweetsController < ApplicationController
  def new
  	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
  	SendTweet.new(@tweet.content).perform
  	redirect_to root_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
