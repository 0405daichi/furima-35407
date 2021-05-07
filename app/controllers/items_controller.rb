class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order('created_at DESC')
    @sold_items = SoldItem.all
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

  def show
    @items = Item.all
    @item = Item.find(params[:id])
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  # end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :item_price, :burden_id, :source_id,
                                 :guideline_id, :image).merge(user_id: current_user.id)
  end
end
