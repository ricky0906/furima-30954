class OrdersController < ApplicationController
  before_action :find_params, only: [:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to items_path(@order_address)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address)
          .permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @item.price,
      card:     order_params[:token],
      currency: 'jpy'
    )
  end
end
