class NotesController < ApplicationController
    before_action :logged_in
    before_action :correct_user, only: [:show, :edit, :update, :destroy]

    def index
        redirect_to root_url
    end

    def new
        @note = current_user.notes.new
    end

    def create
        @note = current_user.notes.create(user_params)
        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end

    def show
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end

    def edit
    end

    def update
        if @note.update(user_params)
            redirect_to @note
        else
            render 'edit'
        end
    end

    def destroy
        @note.destroy
        redirect_to root_url
    end

    private
        
        def user_params
            params.require(:note).permit(:title, :content)
        end

        def logged_in
            unless logged_in?
                store_location
                flash[:alert] = "Por favor ingrese sus datos."
                redirect_to login_url
            end
        end

        def correct_user
            @note = current_user.notes.find_by_id(params[:id])
            if @note.nil?
                # Render 404
                render file: "#{Rails.root}/public/404.html" , status: :not_found
            end
        end

end
