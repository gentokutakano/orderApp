class OrdersController < ApplicationController

  def index
    @zaikos = SoukoZaiko.where(stock_type: "01")
    @items  = OrderItem.new
    @order = Order.new
    # binding.pry
  end

  def new
    @zaikos = SoukoZaiko.new
    @items = OrderItem.new
    binding.pry
  end

  def create
    @order = Order.new(order_params)
    @order_item = @order.order_items.build(order_item_params)
    @zaikos = SoukoZaiko.where(sku_code: @order_item.sku_code)

    binding.pry

    if @order.save

      if @order_item.save
        @quantity_item = @order_item.quantity
        @zaikos[0].stock = @zaikos[0].stock - @quantity_item
      end

      if @zaikos[0].stock == 0
        @zaikos[0].stock_type = '02'
      end
      @zaikos[0].save

      flash[:success] = "ユーザー登録しました。"
      redirect_to root_path
    else
      flash[:danger] = "ユーザー登録に失敗しました。"
      redirect_to root_path
    end
  end

  def stock
    @stocks = SoukoZaiko.where(sku_code_id: params[:sku_code_id])
    binding.pry
  end

  private
    def order_params
      params.require(:order).permit(
        :id, :name, :total_amount,
          :tax, :delivery_zipcode, :delivery_state,
            :delivery_city, :delivery_area, :delivery_address)
    end

    def order_item_params
      params.require(:order_item).permit(:id, :sku_code, :quantity, :price, :total_amount)
    end
end
