class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    user = User.find(session[:signed])
    @event = user.created_events.build
  end

  def create
    user = User.find(session[:signed])
    @event = user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      @event.attendees << user
      redirect_to event_path(@event)
    else
      flash.now[:error] = "No."
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    if session[:signed] != nil
      user = User.find(session[:signed])
      event_attendees = Event.find(params[:id]).attendees
      if event_attendees.include? user
        flash[:error] = "You already attend this event"
      else
        event_attendees << user
        flash[:success] = "You are now attending this event"
      end
    else
      flash[:error] = "You must be logged in to attend an event"
    end
    redirect_to event_path(Event.find(params[:id]))
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :date)
    end
end
