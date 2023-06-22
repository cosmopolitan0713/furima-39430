class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_if_seller, only: [:index,:new, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
  
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:order).merge(user_id: current_user.id,item_id: params[:item_id])
  end
  
  def address_params
    params.permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number)
  end

  def redirect_if_seller
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path, alert: "You cannot purchase your own item."
    end
  end
end
