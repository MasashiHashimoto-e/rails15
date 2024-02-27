class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:user_id, :title, :startday, :finishyday, :oneday, :memo)) 
    if @post.save
      flash[:notice] = "新規登録に成功しました"
      redirect_to :posts
    else
      flash[:notice] = "新規登録に失敗しました"
      render "new"
    end
  end
end
 