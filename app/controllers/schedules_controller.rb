class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all.order(start_date: :asc)
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

 def create
  @schedule = Schedule.new(schedule_params)

    if @schedule.save
    redirect_to schedules_path, notice: "予定を登録しました"
    else
    render :new, status: :unprocessable_entity
    end
 end


  def edit
  end

def update
  if @schedule.update(schedule_params)
    redirect_to schedules_path, notice: "予定を更新しました"
  else
    render :edit, status: :unprocessable_entity
  end
end



  def destroy
  @schedule = Schedule.find(params[:id])
  @schedule.destroy
  redirect_to schedules_path, notice: "予定を削除しました"
end


  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end


