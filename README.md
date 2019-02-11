# README

  ## TAKE ME OUT  

  <h2>Présentation</h2>

## Bienvenue dans les prémices de l'appli Take Me Out 

<center><h3>Dans ce repo tu trouveras :</h3></center>
<li>
<ul>des models (User, Event, Attendance)</ul></li>
<li><ul>les migrates et les spec correspondants</ul></li>
<li><ul>un User Mailer et un Attendance Mailer (avec des views) pour envoyer automatiquement des mails lors de la création d'un utilisateur et lorsqu'il rejoint un évènement</ul>
</li> 

  <h2>La marche à suivre</h2>

  <center><h3>Pour que tout se passe correctement tu dois faire:</h3></center>
  <li><ul>``` git clone monrepo ```</ul></li>
  <li><ul>`bundle install`</ul></li>
  <li><ul>`rails db:create`</ul></li>
  <li><ul>`rails db:migrate`</ul></li>
  <li><ul>`rails db:seed`</ul></li>

  <center><h3>Les tests se lancent avec un simple `rspec` à la racine du dossier</h3></center>

  <center><h3>Pour tester les mails :</h3></center>
  <li><ul>`rails console'</ul></li>
  <li><ul>'User.create(first_name:"Tonprénom", last_name:"Tonnom", "email:"tonprénombizarre@yopmail.com")</ul></li>
  <li><ul>`Attendance.new(event_id: 1..10, attendee_id: 'l'id de ton user')</ul></li>
  <li><ul>Consulte la boîte mail `tonprénombizarre` sur le site `yopmail.com'</ul></li>

  <center><img src="https://media.giphy.com/media/UwrdbvJz1CNck/giphy.gif"></center>

  <center><p>Et voilà, normalement je n'ai rien oublié, bonne corrections !</p><center>
