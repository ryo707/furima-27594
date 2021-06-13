class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :user_item_id, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def user_item_id
    current_user.id == @item.user.id
  end

  # def destroy
  #   if user_signed_in? && current_user.id == @item.user_id
  #     @item.destroy
  #     redirect_to root_path
  #   end
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_day_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end



