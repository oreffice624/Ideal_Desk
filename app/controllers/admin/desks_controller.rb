class Admin::DesksController < ApplicationController
   before_action :if_not_admin
     before_action :set_desk, only: [:show, :edit, :destroy]

  #中略

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def set_desk
    @desk = DeskDesk.find(params[:id])
  end

end
