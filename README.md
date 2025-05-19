🎟️ EventBookingApp
EventBookingApp is a full-stack web application built with Ruby on Rails, designed to facilitate event reservations. Users can create accounts, browse events, make reservations, leave comments, reply to others, and rate events. The frontend utilizes Bootstrap for a clean and responsive user interface.

✨ Features
User Authentication: Secure sign-up and login functionalities.

Event Browsing: View a list of available events with detailed information.

Reservations: Reserve spots for desired events.

Commenting System: Leave comments on events and reply to existing comments.

Rating Mechanism: Rate events, with average ratings displayed on event pages.

Responsive Design: Clean and responsive UI using Bootstrap.

🛠️ Technologies Used
Backend: Ruby on Rails

Frontend: Bootstrap

Database: SQLite (for development)

🚀 Getting Started
Prerequisites
Ruby and Rails installed on your machine.

Installation
Clone the repository:

bash
Copy
Edit
git clone https://github.com/yourusername/EventBookingApp.git
cd EventBookingApp
Install dependencies:
GitHub
+6
palplanner.com
+6
GitHub
+6

bash
Copy
Edit
bundle install
Set up the database:

bash
Copy
Edit
rails db:create
rails db:migrate
Start the server:

bash
Copy
Edit
rails server
Visit http://localhost:3000 in your browser to use the application.

📂 Project Structure
app/models – Contains the application's models.

app/controllers – Contains the controllers handling requests.

app/views – Contains the views rendered to the user.

config/routes.rb – Defines the application's routes.

