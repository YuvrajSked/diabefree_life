# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed_file|
  puts "Loading seed file: #{seed_file}"
  load seed_file
end


programs_data = [
  {
    title: "Diabetes Reversal Program",
    description: "India's Best Type 2 Diabetes Reversal Program - Clinically proven program to Control Blood Sugar and HbA1c Levels Naturally.",
    features: "Personalized Diet & Fitness Plans|Dedicated Health Coaches|The Best Diabetes Doctors|Continuous Glucose Monitoring|Track Your Progress Anytime|Face Based Vitals",
    price: 15000.00,
    duration: 6,
    program_type: 2,
    active: true
  },
  {
    title: "Basic Diabetes Management",
    description: "Essential diabetes management program for beginners looking to understand and control their condition.",
    features: "Basic Diet Guidelines|Weekly Check-ins|Educational Resources|Blood Sugar Tracking",
    price: 8000.00,
    duration: 3,
    program_type: 0,
    active: true
  },
  {
    title: "Premium Diabetes Reversal",
    description: "Advanced program with 24/7 support and personalized coaching for complete diabetes reversal.",
    features: "24/7 Health Coach Support|Advanced CGM Monitoring|Personalized Meal Plans|Exercise Coaching|Stress Management|Sleep Optimization",
    price: 25000.00,
    duration: 12,
    program_type: 1,
    active: true
  }
]

programs_data.each do |program_attrs|
  program = Program.find_or_initialize_by(title: program_attrs[:title])
  program.update!(program_attrs)
end
puts "Seeded #{Program.count} programs"

# Admin User

admin_user_date = [
  {
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  },
  {
    email: 'admin2@example.com',
    password: 'password',
    password_confirmation: 'password'
  }
]

admin_user_date.each do |admin_user_attrs|
  admin_user = AdminUser.find_or_initialize_by(email: admin_user_attrs[:email])
  admin_user.update!(admin_user_attrs)
end
puts "Seeded #{AdminUser.count} Admin User"
