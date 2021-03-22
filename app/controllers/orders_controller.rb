class OrdersController < ApplicationController
  # before_action :arrey_filter

  def index
    @zaikos = SoukoZaiko.where(stock_type: "01")
    @order = Order.new
    # @items  = 2.times { @order.order_items.build }
    @items  = @order.order_items.build
    # binding.pry
  end

  def new
    @zaikos = SoukoZaiko.new
    @items = OrderItem.new
    binding.pry
  end

  def create

    @order = Order.new(order_params)
    # 未入力配列を削除
    @order.order_items = @order.order_items.reject{|m|
      m.sku_code.blank? || m.quantity == 0 || m.price == 0 || m.total_amount.blank?}
    @zaikos = SoukoZaiko.where(id: @order.order_items.map{|m| m.sku_code })
    # binding.pry

    if @order.save
      @order_quantity = @order.order_items.map{|m| m.quantity }

      # 在庫数量 - 購入数量
      @order_quantity.each_with_index do |buy, i|
        @zaikos[i].stock = @zaikos[i].stock - buy
        if @zaikos[i].stock == 0
          @zaikos[i].stock_type = '02'
        end
        @zaikos[i].save
      end

      flash[:success] = "注文を受け付けました"
      redirect_to root_path
    else
      flash[:danger] = "注文に失敗しました。"
      redirect_to root_path
    end
  end

  def update
  end

  def stock
    @stocks = SoukoZaiko.where(sku_code_id: params[:sku_code_id])
    binding.pry
  end

  private
    def order_params
      params.require(:order).permit(
        :id, :name, :purchase_amount,
          :tax, :delivery_zipcode, :delivery_state,
            :delivery_city, :delivery_area, :delivery_address,
            order_items_attributes: [:id, :sku_code, :quantity, :price, :total_amount]
        )
    end

    def order_item_params
      params.require(:order_item).permit(:id, :sku_code, :quantity, :price, :total_amount)
    end

    def souko_zaiko_params
      params.require(:souko_zaiko).permit(:id, :sku_code, :stock_type, :stock, :price)
    end
end
