class AttendancesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees.count
  end

  def index
    @attendances = Attendance.all 
    @event = Event.find(params[:event_id])
  end
  
  def create
    @event = Event.find(params[:event_id])
    @user = current_user

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
    
    a = Attendance.create(event: @event, attendee: @user, stripe_customer_id: params[:stripeToken])
    
    if a.save 
      flash[:success] = "Votre participation à l'évènement a été enregistrée"
      redirect_to event_path@event
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event

  end

end
=begin
  if 
    @event.attendees.include? current_user
    flash[:error] = "Vous participez déjà à l'évènement"
    redirect_to @event
    end

    @event.attendees << current_user
    flash[:success] = "Vous avez rejoint l'évènement"
    redirect_to @event
=end 
