class OrderItemsController < ApplicationController
  def index
    binding.pry
  end


  def show
    binding.pry
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    @zaikos = SoukoZaiko.where(sku_code: @order_item.sku_code)
    # @order_item.sku_co

    if @order_item.save
      @quantity_item = @order_item.quantity
      @zaikos[0].stock = @zaikos[0].stock - @quantity_item
      binding.pry

      if @zaikos[0].stock == 0
        @zaikos[0].stock_type = '02'
      end
      @zaikos[0].save

      flash[:success] = "注文を受け付けました。"
      redirect_to root_path
    else
      flash[:danger] = "注文はキャンセルされました。"
      redirect_to root_path
    end
  end

  def new
    binding.pry
  end


  private
    def order_item_params
      params.require(:order_item).permit(:id, :sku_code, :quantity, :price, :total_amount)
    end
end
