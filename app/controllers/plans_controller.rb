class PlansController < ApplicationController
  before_action :require_user_logged_in
  def show
    @plan = current_user.plans.find_by(id: params[:id])
    @schedules = @plan.schedules.where(day: 1)
  end

  def new
    @plan =Plan.new
  end

  def create
    @plan = current_user.plans.build(plan_params)
    
    if @plan.save
      flash[:success] = "プランが正常に投稿されました"
      redirect_to root_url
    else
      flash.now[:danger] = "プランが投稿されませんでした"
      render :new
    end
  end

  def edit
    @plan = current_user.plans.find_by(id: params[:id])
  end

  def update
    @plan = current_user.plans.find_by(id: params[:id])
    
    if @plan.update(plan_params)
      flash[:success] = "プランは正常に更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "プランは更新されませんでした"
      render :edit
    end
  end

  def destroy
    @plan = current_user.plans.find_by(id: params[:id])
    @plan.destroy
    
    flash[:success] = "プランは正常に削除されました"
    redirect_to root_url
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:title)
  end
end
