class SubsController < ApplicationController
    before_action :require_login!

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = params.user_id

        if @sub && @sub.save
            redirect_to user_url(@sub.user_id)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end        
    end

    def show
        @sub = current_user.subs.find_by(id: params[:id])
        render :show
    end

    def index
        @subs = Subs.all
        render :index
    end

    def edit
        @subs = Subs.find_by(id: params[:id])
        render :edit
    end

    def update
        @subs = Subs.find_by(id: params[:id])
        if @sub && @sub.update(sub_params)
            redirect_to subs_url
        else
            flash[:errors] = ["something went wrong"]
            render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
