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
      flash[:notice] = "Successfully created!"
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def update
    @meeting = Meeting.find(params[:id])

    if @meeting.update(meeting_params)
      redirect_to @meeting
    else
      render 'edit'
    end

  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to rooms_path
  end

  private


  def meeting_params
    params.require(:meeting).permit(:title, :begins, :ends, :user_id, :room_id )
  end

  
end
