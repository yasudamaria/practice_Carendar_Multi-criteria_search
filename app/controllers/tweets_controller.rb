class TweetsController < ApplicationController
    before_action :search_product, only: [:index, :index2]
    before_action :set_beginning_of_week
    before_action :move_to_signed_in

    def calendar
        @tweets = params[:user_id].present? ? User.find(params[:user_id]).tweets : Tweet.all
        @books = Tweet.all
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end


    def edit

    end

    def index
        if params[:search] == nil
            @tweets= Tweet.all
        elsif params[:search] == ''
            @tweets= Tweet.all
        else
            @tweets = Tweet.where("title LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def index2
        @tweets= Tweet.all
    end

    def new
        @tweet =Tweet.new
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body, :title, :start_time)
    end

    def search_product
        @p = Tweet.ransack(params[:q])  # 検索オブジェクトを生成
        @results = @p.result
    end

    def set_beginning_of_week
        Date.beginning_of_week = :sunday
    end

    def move_to_signed_in
        unless user_signed_in?
          redirect_to  '/users/sign_in'
        end
    end
end
