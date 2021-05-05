class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :item_price, :burden_id, :source_id, :guideline_id, :image).merge(user_id: current_user.id)
  end
end
