class CatsController < ApplicationController

    def index
        @kitties = Cat.all 
        render :index        
    end

    def show
        @kitty = Cat.find(params[:id])
        render :show
    end


    private
    def cat_params
        params.require(:cat).permit(:age, :birth_date, :color, :name, :sex, :description)
    end
end

