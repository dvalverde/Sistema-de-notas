class SessionsController < ApplicationController

    def index
        if logged_in?
            @username = current_user.username
            @notes = current_user.notes
        else
            redirect_to login_url
        end
    end

    def login
        if logged_in?
            redirect_to root_url
        end
    end

    def create
        user = User.where("lower(username) = ?", params[:session][:username].downcase).first

        if !!user && user.authenticate(params[:session][:password])
            log_in user
            redirect_back_or root_url
        else
            message = "Usuario o contraseña incorrecta"
            flash.now[:alert] = message
            render 'login'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end

end
