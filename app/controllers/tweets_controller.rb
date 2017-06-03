class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
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
  
  def create
    @tweet = Tweet.create(tweets_params)

    if @tweet.save
      # 一覧画面へ遷移して"ブログ投稿が完了しました！"とメッセージを表示します。
    redirect_to tweets_path, notice: "つぶやき投稿が完了しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
    
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    # edit, update, destroyで共通コード
    @tweet = Tweet.find(params[:id])
    
    
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "つぶやきを更新しました！"
    else
      render 'edit'
    end
    
  end
  
  def destroy
    # edit, update, destroyで共通コード
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "つぶやきを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    #contentカラムのみ取得する
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    # idをキーとして値を取得するメソッド
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
