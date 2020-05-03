class StoresController < ApplicationController

  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result
    @stores = @stores.page(params[:page]).per(20).order(created_at: :desc)
    respond_to do |format|
     format.html
     format.csv{ send_data @stores.generate_csv, filename: "stores-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
        redirect_to stores_path
    else
        render 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
    add_breadcrumb '記事編集', '/stores/edit'
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
        redirect_to stores_path
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
        redirect_to stores_path
    else
        render 'edit'
    end
  end

  def import
    Store.import(params[:file])
    redirect_to root_url, notice:"リストを追加しました"
  end

  private
    def store_params
        params.require(:store).permit(
          :store, #店舗名
          :evaluation,
          :url,
          :tel, #電話番号
          :address, #住所
          :genre, #ジャンル
          :payment, #支払方法
          :genre, #ジャンル
          :payment, #支払方法
          :price_lunch, #ランチ単価
          :price_dinner, #ディナー単価
          :hour, #営業時間
          :holiday, #定休日
          :budget, #予算
          :price, #料金
          :difficulty, #難易度
          :bookking, #予約方法
          :remarks, #備考
          :takeout,
          :image_1,
          :image_2,
          :image_3,
          :image_4,
          :image_5,
          :image_6,
          :image_7,
          :image_8,
          :image_9,
          :image_10
        )
    end
end
