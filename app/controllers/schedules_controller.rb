class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @plan = current_user.plans.find_by(id: params[:plan_id])
    
    if @plan && @plan.schedules.any?
      @schedules = @plan.schedules.order(:start_time).where(day: 1)
    end
  end

  def day2
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 2)
    render :index
  end

  def day3
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 3)
    render :index
  end

  def day4
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 4)
    render :index
  end

  def day5
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 5)
    render :index
  end

  def day6
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 6)
    render :index
  end

  def day7
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedules = @plan.schedules.where(day: 7)
    render :index
  end

  def new
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedule = Schedule.new
  end

  def create
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedule = @plan.schedules.build(schedule_params)
    
    if @schedule.save
      flash[:success] = "スケジュールが正常に投稿されました"
      redirect_to plan_schedules_url
    else
      flash.now[:danger] = "スケジュールが投稿されませんでした"
      render :new
    end
  end

  def edit
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedule = @plan.schedules.find_by(id: params[:id])
  end

  def update
    @plan = current_user.plans.find_by(id: params[:plan_id])
    @schedule = @plan.schedules.find_by(id: params[:id])
    
    if @schedule.update(schedule_params)
      flash[:success] = "スケジュールは正常に更新されました"
      redirect_to plan_schedules_url
    else
      flash.now[:danger] = "スケジュールは更新されませんでした"
      render :edit
    end
  end

  def destroy
    @plan = current_user.plans.find_by(id: params[:plan_id])
    
    schedule = @plan.schedules.find_by(id: params[:id])
    schedule.destroy
    
    flash[:success] = "プランは正常に削除されました"
    redirect_to plan_schedules_url
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:day, :start_time, :destination, :category, :memo)
  end
end
