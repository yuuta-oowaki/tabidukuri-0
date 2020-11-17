module SchedulesHelper
  def exists_schedule?
    return nil if @plan.nil?
    User.where(id: session[:user_id]).joins(plans: :schedules).includes(plans: :schedules).merge(Plan.where(id: @plan[:plan_id])).merge(Schedule.where(day: 1)).present?
  end
end