class PagesController < ApplicationController
  def index
    @q = Page.ransack(params[:q])
    @pages = @q.result
    @pages = @pages.all.order(created_at: 'desc')
    respond_to do |format|
     format.html
     format.csv{ send_data @pages.generate_csv, filename: "pages-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
      @page = Page.find(params[:id])
    end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
        redirect_to pages_path
    else
        render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

 def update
    @page = Page.find(params[:id])
     if @page.update(page_params)
        redirect_to pages_path
    else
        render 'edit'
    end
 end

 def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
 end

 def import
   Page.import(params[:file])
   redirect_to pages_url, notice:"リストを追加しました"
 end

private
 def page_params
  params.require(:page).permit(
    :main_title_1,
    :main_title_2,
    :main_title_3,
    )
  end
end
