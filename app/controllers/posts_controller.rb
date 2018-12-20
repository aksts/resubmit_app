class PostsController < ApplicationController

  before_action :sign_in_required, only: [:show]
  before_action :correct_user,     only: [:edit, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def detail
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build if user_signed_in?
  end

  def create
    @post = current_user.posts.build(post_params)
    if  @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end


  private

   def post_params
     params.require(:post).permit(:title, :body)
   end

   def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      if  @post.nil?
        redirect_to post_path
        flash[:danger] = "Not yours"
      end
   end
end
