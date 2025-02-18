require 'faker'

# Créer 20 utilisateurs avec des e-mails @yopmail.com
20.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email_address: Faker::Internet.unique.user_name + "@yopmail.com",
    password: "password123", # Assure que BCrypt fonctionne avec has_secure_password
    created_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
    updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now)
  )
end
puts "✅ 20 utilisateurs créés avec succès !"

# Vérifier qu'il y a bien des utilisateurs avant de créer les événements
if User.count > 0
  10.times do
    Event.create!(
      user: User.all.sample,
      start_date: Faker::Time.between(from: Time.now, to: Time.now + 1.year),
      duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
      title: Faker::Lorem.sentence(word_count: 5),
      description: Faker::Lorem.sentence(word_count: 20),
      price: rand(1..1000),
      location: Faker::Address.city,
      created_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
      updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now)
    )
  end
  puts "✅ 10 événements créés avec succès !"
else
  puts "⚠️ Aucune création d'événement : pas d'utilisateur disponible."
end

# Vérifier qu'il y a bien des événements et des utilisateurs avant de créer des participations
if User.count > 0 && Event.count > 0
  5.times do
    Attendance.create!(
      user: User.all.sample,
      event: Event.all.sample,
      stripe_customer_id: Faker::Number.number(digits: 10)
    )
  end
  puts "✅ 5 participations créées avec succès !"
else
  puts "⚠️ Aucune création de participation : pas d'utilisateur ou d'événement disponible."
end
