class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @desk = Desk.find(params[:desk_id])
    @reviews = @desk.reviews
  end
  
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    #新着順で表示
    @comments = @review.comments.order(created_at: :desc)
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to desk_reviews_path(@review.desk)
    else
      @desk = Desk.find(params[:desk_id])
      render "desks/show"
    end
  end

   def edit
    @review = Review.find(params[:id])
     if @review.user != current_user
        redirect_to desks_path, alert: "不正なアクセスです。"
     end
   end

  def update
    @review = Review.find(params[:id])
    if @review.update(desk_params)
      redirect_to review_path(@review), notice: "Review updated!"
    else
      render :edit
    end
  end


  def destroy
    @desk = Desk.find(params[:desk_id])
    review = @desk.reviews.find(params[:id])
    if current_user.id == review.user.id
      review.destroy
    redirect_to reviews_path
    else
    render "desks/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:desk_id, :score, :content)
  end
end