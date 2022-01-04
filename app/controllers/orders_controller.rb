class OrdersController < ApplicationController
    before_action :set_order, only: %i[show]

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])  
            @orders = @user.orders
        else
            @restaurant = Restaurant.find(params[:restaurant_id])
            @orders = @restaurant.orders 
        end
    end

    def new
        if params[:user_id]
            @user = User.find(params[:user_id])
        end
        if params[:restaurant_id]
        @restaurant = Restaurant.find(params[:restaurant_id])
        end    
        @order = Order.new(user_id: @user&.id, restaurant_id: @restaurant&.id) 
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to root_path
        else
            render actin: "new"
        end
    end
    
    def show
    end


    private
    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(:user_id, :restaurant_id)
    end

end
