class UserMailer < ActionMailer::Base
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 

      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 

      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email_address, subject: 'Bienvenue chez nous !') 
    end

    def attendance_participation_email(attendance)
      @user = attendance.user
      @attendance = attendance
      @attendee = attendance.user.first_name
      @event = attendance.event
      @event_title = @event.title
      mail(to: @user.email_address, subject: 'Votre participation a bien été prise en compte !')
      puts "Un email a été envoyé à l'utilisateur #{attendance.user.email_address} pour l'événement #{attendance.event.title}"
    end
end 