class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_if_seller, only: [:index,:new, :create]
  
  def index
    @item = Item.find(params[:item_id])
    if @item.user == current_user || @item.order.present?
      redirect_to root_path
    else
      @order = Order.new
      @order_address = OrderAddress.new
    end
  end
  
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def redirect_if_seller
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path, alert: "You cannot purchase your own item."
    end
  end
end
