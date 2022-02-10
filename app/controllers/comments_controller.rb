class CommentsController < ApplicationController

 def create
  @estimate = Estimate.find(params[:estimate_id])
  @estimate.comments.create(comment_params)
  redirect_to estimate_path(@estimate)
 end

 def destroy
  @estimate = Estimate.find(params[:estimate_id])
  @comment = @estimate.comments.find(params[:id])
  @comment.destroy
  redirect_to estimate_path(@estimate)
 end

 def update
  @estimate = Estimate.find(params[:estimate_id])
  @comment = @estimate.comments.find(params[:id])
  if @comment.update(comment_params)
    redirect_to estimate_path(@estimate)
  else
    render 'edit'
  end
 end

 private
 def comment_params
  params.require(:comment).permit(
    :asahi,
    :cocacola,
    :dydo,
    :itoen,
    :kirin,
    :otsuka
  )
 end

end
