class OrdersController < ApplicationController

  def index
    @order = Order.new(user_id: current_user.id, item_id: params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order = Order.new(user_id: current_user.id, item_id: params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      # pay_item
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: 1000,  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

end
