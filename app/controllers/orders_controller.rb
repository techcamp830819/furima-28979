class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :move_order, only: [:index]

  def index
    redirect_to root_path if @item.order
    @order = Userbuy.new
    redirect_to user_session_path unless user_signed_in?
  end

  def new
    @order = Order.new
  end

  def create
    @order = Userbuy.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_order
    redirect_to root_path if current_user.id == @item.user_id
  end
end
