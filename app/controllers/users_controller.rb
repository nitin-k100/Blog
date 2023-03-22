class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized_user, except: [:login_, :create, :new,:login]
    def new 
        @user = User.new  
    end   
     
    def create
        @user = User    .new(parameter)
        if @user.save
            # log_in @user
            redirect_to  login_path
            #  token = encode_token({user_id: @user.id\})
            #  render json: {user: @user, token: token}, status: :ok
        else
            #redirect_to '/users/new'
            render 'users/new'
        end   
    end
    
    def login_   
        @user = User.find_by(:username=>params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            #render json: {user: @user, token: token}, status: :ok
            log_in(@user.id)
            redirect_to @user
        else
            #render json: {errors: "wrong user"}
            render login_path
        end
    end

    def index 
        @user = User.all
        render json: @user
    end
    
    def destroy
        session[:token_id] = nil
        redirect_to root_path
    end

    private 

    def parameter 
        params.require(:user).permit(:password,:username) 
    end  

end