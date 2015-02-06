class MeetingsController < ApplicationController
  authorize_resource
  skip_authorize_resource only: [:edit]

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
    authorize! :edit, @meeting
  end

  def create
    @meeting = current_user.meetings.build(meeting_params)

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
    params.require(:meeting).permit(:title, :begins, :ends, :room_id)
  end
end
