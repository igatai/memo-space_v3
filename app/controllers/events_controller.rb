class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @events }
      format.json { render :json => @events }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessabe_entirely }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :updated, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: unprocessabe_entirely }
      end
    end
  end

  def destroy
    @event.destroy
    renpond_to do |format|
      format.html { redirect_to event_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :title,
      :content,
      :start,
      :end,
      :color,
      :allday,
      :user_id
    )
  end
end