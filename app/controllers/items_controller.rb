class ItemsController < ApplicationController
  before_action :set_item_find, only:[:destroy]

  before_action :set_item, only: [:show, :buy, :pay, :done]
  before_action :set_card, only: [:buy, :pay]

  def index
    @roots = Category.roots.limit(4)
    @items = Item.all.limit(10).order('created_at DESC')
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @item.saler_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @saler = User.find(@item.saler_id)
    @saler_items = Item.where(saler_id: @saler.id).limit(6).order('id DESC')

    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def buy
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )

    item_update
    redirect_to action: 'done' #完了画面に移動
  end

  def done
  end

  def detail
    @item = Item.includes(:photos).find(params[:id])
    @saler = User.find(@item.saler_id)

    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def destroy
    if @item.saler_id == current_user.id && @item.destroy
      redirect_to root_path
    else 
      redirect_to items_path(@item)
    end
  end

  private

  def set_item
    @item = Item.includes(:photos).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :state, :size, :method, :carriage, :region, :date, :price, :category_id).merge(saler_id: current_user.id)
  end

  def set_item_find
    @item = Item.find(params[:id])
  end
  
  def item_update
    @item.update(name: @item.name, description: @item.description, state: @item.state, size: @item.state, method: @item.method, carriage: @item.carriage, region: @item.region, date: @item.date, price: @item.price, category_id: @item.category_id, saler_id: @item.saler_id, buyer_id: current_user.id)
  end

  def set_card
    @card = current_user.card
  end
end