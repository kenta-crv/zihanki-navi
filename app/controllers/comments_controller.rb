class CommentsController < ApplicationController

	def create
		@estimate = Estimate.find(params[:estimate_id])
		@estimate.comment.create(comment_params)
		redirect_to estimate_path(@estimate)
	end

  def edit
    @estimate = Estimate.find(params[:estimate_id])
    @comment = Comment.find(params[:id])
    #@comment = @estimate.comments.build
  end

	def destroy
		@estimate = Estimate.find(params[:estimate_id])
		@comment = @estimate.comment.find(params[:id])
		@comment.destroy
		redirect_to estimate_path(@estimate)
	end

	 def update
    @comment = Comment.find(params[:estimate_id])
    @comment = @estimate.comment.find(params[:id])
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
    :itoen
    )
 	end
end
