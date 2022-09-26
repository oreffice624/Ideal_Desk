class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_search

def set_search
  #@search = Article.search(params[:q])
  @search = Desk.ransack(params[:q]) #ransackメソッド推奨
  # @desks = @search.result.page(params[:page])
end
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
