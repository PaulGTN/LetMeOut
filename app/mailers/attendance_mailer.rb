class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@takemeout.fr'

  def event_attendance_confirmation(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://takemeout.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.event.admin.email, subject: 'Une personne a rejoint ton évènement !') 
  end

end
