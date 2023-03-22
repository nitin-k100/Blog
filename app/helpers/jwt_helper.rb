module JwtHelper

    def log_in(id)
        token = encode_token({user_id: id})
        session[:token_id] = token
    end

    def log_out
        session[:token_id] = nil
        redirect_to root_url
    end

    def encode_token(payload)
        JWT.encode(payload,'secret','HS256')
    end

    def decode_token
        token = session[:token_id]
        if token
            res = JWT.decode(token,'secret',true,{algorithm: 'HS256'})
        end
    end
    
    private 
    
    def authorized_user
        decoded_token = decode_token
        if decoded_token.present?
            user_id = decoded_token[0]["user_id"]
            @user  = User.find_by(:id=>user_id)
        else
            redirect_to root_url
        end
    end

end

