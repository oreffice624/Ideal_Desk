class CommentsController < ApplicationController
  def create
      @review = Review.find(params[:review_id])
      #投稿に紐づいたコメントを作成
      @comment = @review.comments.build(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
      else
      redirect_back(fallback_location: root_path)  #同上
      end
  end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to request.referer
    end


    private
    def comment_params
      params.require(:comment).permit(:content, :review_id, :user_id)
    end
end
