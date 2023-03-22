class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized_user
        
    def new 
        @post = Post.new  
    end

    #GET 
    def index 
        if(params[:id].present?)
            @post = @user.posts.all
            @flag = 1
        else
            @post = Post.all
        end
    end
   
    #POST id
    def create 
        @post = Post.new(parameter)
        @post.user_id = @user.id
        if(@post.save)
            redirect_to @post
        else 
            render 'new'
        end 
    end

    #GET /id
    def show 
       @post = Post.find(params[:id])
       @post_comments = @post.comments.all
    end

    private 

    def parameter 
        params.require(:post).permit(:userid,:post_description,:post_name) 
    end  
end