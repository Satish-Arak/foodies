class ItemsController < ApplicationController
    before_action :set_restaurant

    def index
        @items = @restaurant.items
    end

    def new
        @item = @restaurant.items.build
    end

    def create
        @item = @restaurant.items.build(item_params)

        if @item.save
        redirect_to restaurant_path(@restaurant)
        else
        render action: 'new'
        end
    end

    def show
        @item = @restaurant.items.find(params[:id])
    end


    
    private
    def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def item_params
        params.require(:item).permit(:name, :price, :restaurant_id)
    end 
end
