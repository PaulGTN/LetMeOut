class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:create, :destroy, :udpate]

  def show
   @event=Event.find(params[:id])
   @attendees=@event.attendances.count
  end

  def index
    @events=Event.all
  end

  def new
  end

  def create
   
    e=Event.create(start_date: @start_date, duration: @duration, title: @title, description: @description, price: @price, location: @location, admin: @admin)
 
    if e.save
     flash[:success] = "Ton évènement a bien été créé"
      redirect_to event_path(e)

    else
     flash[:danger] = "Une erreur est survenue"
      redirect_to new_event_path
    end

  end

  def destroy
  end

  def update
  end

end
