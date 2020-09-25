class OrdersController < ApplicationController
  def index
    @order = Userbuy.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end
 
  def create
    @order = Userbuy.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
       pay_item
       @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def order_params
    params.permit(:token, :item_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
 end