class ApplicationController < ActionController::Base
    add_flash_types :info, :error
    include JwtHelper

end

