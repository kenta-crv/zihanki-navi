class CommentsController < ApplicationController
  before_action :load_estimate
  before_action :load_comment, only: [:edit,:update,:show,:destroy]
  #before_action :authenticate_admin!

  def load_estimate
    @estimate = Estimate.find(params[:estimate_id])
    @comment = Comment.new
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def edit
  end

  def create
    @comment = @estimate.comments.new(comment_params)
    @comment.save
  end

  def update
    if @comment.update(comment_params)
      redirect_to estimate_path(@estimate.id)
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
