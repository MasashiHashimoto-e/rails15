class PostsController < ApplicationController
  def index
    @posts = Post.all
    @schedule_total = Post.all.count
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:user_id, :title, :startday, :finishday, :oneday, :memo)) 
    if @post.save
      flash[:notice] = "新規登録に成功しました"
      redirect_to :posts
    else
      flash[:notice] = "新規登録に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:user_id, :title, :startday, :finishday, :oneday, :memo)) 
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:notice] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "ユーザーを削除しました"
     redirect_to :posts
  end
end
 