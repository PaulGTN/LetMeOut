class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:create, :destroy, :udpate]

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
   
    e=Event.create(start_date: @start_date, duration: @duration, title: @title, description: @description, price: @price, location: @location, admin: @admin)
 
    if e.save
     flash[:success] = "Ton évènement a bien été créé"
      redirect_to event_path(e)

    else
     flash[:danger] = "Une erreur est survenue"
      redirect_to new_event_path
    end

  end

=begin
  def subscribe
    @event = Event.find(params[:id])
    if 
    @event.attendees.include? current_user
    flash[:error] = "Vous participez déjà à l'évènement"
    redirect_to @event
    end

    @amount = @event.price

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Paiement évènement',
      :currency    => 'eur'
    )
    @event.attendees << current_user
    flash[:success] = "Vous avez rejoint l'évènement"
    redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event

  end
=end

  def destroy
  end

  def update
  end

  private 
  def owner
    if current_user != User.find(params[:id])
      flash[:danger] = "Tu ne peux pas accéder aux autres profils"
    end
  end 

  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Tu dois être connecté pour accéder à ce contenu"
      redirect_to user_session_path
    end
  end
  
end

