class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:destroy, :edit, :show, :update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :ship_id, :prefecture_id, :day_id, :price, :user_id ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end