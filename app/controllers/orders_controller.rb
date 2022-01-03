class OrdersController < ApplicationController
    def index
        
    end


    def new
        if params[:user_id]
            @user = User.find(params[:user_id])
        end
        if params[:restaurant_id]
        @restaurant = Restaurant.find(params[:restaurant_id])
        end        
    end
end
