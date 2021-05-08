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
    @item = Item.find(params[:id])
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    else
      @item = Item.find(params[:id])
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

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
