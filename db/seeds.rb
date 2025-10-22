# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

AdminUser.destroy_all

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed_file|
  puts "Loading seed file: #{seed_file}"
  load seed_file
end


# Admin User



puts 'Creating sample Admin User...'

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