class OrdersController < ApplicationController
  before_action :find_params, only: [:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
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
          .merge(user_id: current_user.id, item_id: @item.id)
  end

  def find_params
    @item = Item.find(params[:item_id])
  end
end
