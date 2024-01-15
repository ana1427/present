class PostsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
      @posts = Post.all

      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
      end

    end

    def new
        @post = Post.new
    end
    
    def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
    end

    private
    
    def post_params
    params.require(:post).permit(:present, :body, :relationship, :sex, :image)
    end

end
