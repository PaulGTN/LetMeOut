class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:create, :destroy, :udpate]
  # before_action :event_admin, only:[:update, :destroy, :edit]

  def show
    @event=Event.find(params[:id])
    @attendees=@event.attendances
    @user=current_user
  end

  def index
    @events=Event.all
  end

  def new
    @event = Event.new
    @user_id = current_user.id
  end

  def create

    @title = params[:event][:title]
    @description = params[:event][:description]
    @location = params[:event][:location]  
    year = params[:user][:born_on][0,4].to_i
    month = params[:user][:born_on][5,2].to_i
    day = params[:user][:born_on][8,2].to_i
    hour = params[:task][:started_at][0,2].to_i
    minute = params[:task][:started_at][3,2].to_i
    seconde = 0
    @start_date = DateTime.new(year,month,day,hour,minute,seconde)
    @duration = params[:duration][:price].to_i
    @price = params[:price][:price].to_i
    @admin = current_user
   
    e=Event.create(start_date: @start_date, duration: @duration, title: @title, description: @description, price: @price, location: @location, admin: @admin)
    
    if e.save
     flash[:success] = "Ton évènement a bien été créé"
          redirect_to event_path(e)

    elsif 
     flash[:danger] = "Une erreur est survenue"
      redirect_to new_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path 
    flash[:success] = "Ton évènement a bien été supprimé"
  end


 def edit
  @event=Event.find(params[:id])
end


def update
 @event = Event.find(params[:id])
 title = params[:event][:title]
 description = params[:event][:description]
 location = params[:event][:location]
 duration = params[:event][:duration].to_i
 price = params[:event][:price].to_i
 start_date = params[:event][:start_date]
 admin = current_user
 @event.update(title:title, description:description,location:location, duration:duration, price:price, start_date:start_date, admin:admin)
 puts @event.errors.messages

  if @event.save
  flash[:success] = "Ton évènement a été modifié"
   redirect_to event_path(@event)

 else
  flash[:danger] = "Une erreur s'est produite"
   redirect_to edit_event_path(@event)
 end
end

  private 
=begin
  def event_admin
    if current_user != User.find(params[:id])
      flash[:danger] = "Tu ne peux pas accéder à cette page"
    end
  end
=end 

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu dois être connecté pour accéder à ce contenu"
      redirect_to user_session_path
    end
  end
  
end

