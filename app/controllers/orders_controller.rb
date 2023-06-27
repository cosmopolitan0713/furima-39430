class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_if_seller, only: [:index, :new, :create]
  before_action :set_public_key, only: [:index, :new, :create]
  
  def index
    if @item.user == current_user || @item.order.present?
      redirect_to root_path
    else
      @order = Order.new
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def redirect_if_seller
    @item = Item.find(params[:item_id])
    return unless user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path, alert: 'You cannot purchase your own item.'
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end
end
