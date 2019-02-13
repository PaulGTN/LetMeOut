class AttendancesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees.count
  end

  def index
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees
  end
  
  def create
    @event = Event.find(params[:event_id])
    @user = current_user

    @amount = @event.price * 100

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
      redirect_to event_path @event
    else 
      flash[:danger] = "Connecte toi pour rejoindre un évènement"
      redirect_to event_path @event
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event

  end

end