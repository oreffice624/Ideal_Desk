class CommentsController < ApplicationController
  def create
      @review = Review.find(params[:review_id])
      #投稿に紐づいたコメントを作成
      @comment = @review.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      render :index
  end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      render :index
    end

    private
    def comment_params
      params.require(:comment).permit(:content, :review_id, :user_id)
    end
end