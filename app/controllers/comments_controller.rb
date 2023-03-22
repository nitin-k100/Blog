class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized_user

    #GET 
    def index 
        @comment = Comment.all
    end
   
    #POST id
    def create 
        @comment = Comment.new(parameter)
        @comment.post_id = params[:id]
        @comment.user_name = @user.username
        @comment.save 
        redirect_to "/posts/#{params[:id]}"
    end


    private 

    def parameter 
        params.permit(:description) 
    end  
end