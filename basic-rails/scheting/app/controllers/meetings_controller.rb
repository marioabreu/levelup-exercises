class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.by_date
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      redirect_to @meeting, notice: "Successfully created!"
    else
      render 'new'
    end
  end

  def update
    @meeting = Meeting.find(params[:id])

    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: 'Edited!'
    else
      render 'edit'
    end
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to rooms_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :begins, :ends, :user_id, :room_id)
  end
end
