class DesksController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
    @review = Review.new
  end

  def new
    @desk = Desk.new
  end

   def create
    @desk = current_user.desks.build(desk_params)
    if @desk.save
      redirect_to desk_path(@desk), notice: "デスクを投稿しました。"
    else
      render :new
    end
  end

  def edit
    @desk = Desk.find(params[:id])
     if @desk.user != current_user
        redirect_to desks_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @desk = Desk.find(params[:id])
    if @desk.update(desk_params)
      redirect_to desk_path(@desk), notice: "Desk updated!"
    else
      render :edit
    end
  end


  def destroy
    desk = Desk.find(params[:id])
    desk.destroy
    redirect_to desks_path
  end

  private
  def desk_params
    params.require(:desk).permit(:title, :body, :image)
  end
end
