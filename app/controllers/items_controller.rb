class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :redirect_index, only: [:edit, :update]
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :item_price, :burden_id, :source_id,
                                 :guideline_id, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def redirect_index
    if current_user != @item.user
      redirect_to root_path
    end
  end
end
