class SoldItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  def index
    @sold_item_profile = SoldItemProfile.new
  end

  def create
    @sold_item_profile = SoldItemProfile.new(sold_item_params)
    if @sold_item_profile.valid?
      pay_item
      @sold_item_profile.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def sold_item_params
    params.require(:sold_item_profile).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: sold_item_params[:token],
      currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user == @item.user
    redirect_to root_path if @item.sold_item.present?
  end

end
