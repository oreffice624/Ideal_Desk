class DesksController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    if params[:tag_name].present? #タグの絞り込み
        desks = Desk.tagged_with(params[:tag_name])
    elsif params[:q].present? #ransack検索
        search = Desk.ransack(params[:q])
        desks = search.result.page(params[:page])
    else #通常表示
        desks = Desk.all.order(created_at: :desc)
    end
    @desks = Kaminari.paginate_array(desks).page(params[:page]).per(10)
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

    @desk.user_id=current_user.id
    if @desk.save
       tags = Vision.get_image_data(@desk.image)
    tags.each do |tag|
      @desk.tags.create(name: tag)
    end
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
    redirect_to user_path(desk.user), notice: "Desk Delited"
  end



  private
  def desk_params
    params.require(:desk).permit(:title, :body, :image, :tag_list)
  end
end
