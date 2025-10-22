TeamBanner.delete_all

puts 'Creating sample Team Banners...'

team_banner_data = [
  {
    title: "Meet With Our Creative Dedicated Team.",
    subtitle: "Meet With Our Creative Dedicated Team",
    description: "Our team of dedicated professionals is united by a single mission: to provide you with the highest quality of care."
  }
]

team_banner_data.each do |team_banner_attrs|
  team_banner = TeamBanner.find_or_initialize_by(title: team_banner_attrs[:title])
  team_banner.update!(team_banner_attrs)
end
puts "Seeded #{TeamBanner.count} team banners"


Team.delete_all

puts 'Creating sample Teams...'

teams = [
  {
    first_name: "Alice",
    last_name: "Johnson",
    email: "alice.johnson@example.com",
    phone: "555-0101",
    designation: :doctor,
    facebook_profile_url: "https://facebook.com/alice.johnson",
    twitter_profile_url: "https://twitter.com/alice_johnson",
    linkedin_profile_url: "https://linkedin.com/in/alicejohnson",
    google_profile_url: "https://profiles.google.com/alice.johnson"
  },
  {
    first_name: "Bob",
    last_name: "Smith",
    email: "bob.smith@example.com",
    phone: "555-0102",
    designation: :nutritionist,
    facebook_profile_url: "https://facebook.com/bob.smith",
    twitter_profile_url: "https://twitter.com/bob_smith",
    linkedin_profile_url: "https://linkedin.com/in/bobsmith",
    google_profile_url: "https://profiles.google.com/bob.smith"
  },
  {
    first_name: "Catherine",
    last_name: "Lee",
    email: "catherine.lee@example.com",
    phone: "555-0103",
    designation: :coach,
    facebook_profile_url: "https://facebook.com/catherine.lee",
    twitter_profile_url: "https://twitter.com/catherine_lee",
    linkedin_profile_url: "https://linkedin.com/in/catherinelee",
    google_profile_url: "https://profiles.google.com/catherine.lee"
  },
  {
    first_name: "David",
    last_name: "Miller",
    email: "david.miller@example.com",
    phone: "555-0104",
    designation: :doctor,
    facebook_profile_url: "https://facebook.com/david.miller",
    twitter_profile_url: "https://twitter.com/david_miller",
    linkedin_profile_url: "https://linkedin.com/in/davidmiller",
    google_profile_url: "https://profiles.google.com/david.miller"
  },
  {
    first_name: "Emma",
    last_name: "Brown",
    email: "emma.brown@example.com",
    phone: "555-0105",
    designation: :nutritionist,
    facebook_profile_url: "https://facebook.com/emma.brown",
    twitter_profile_url: "https://twitter.com/emma_brown",
    linkedin_profile_url: "https://linkedin.com/in/emmabrown",
    google_profile_url: "https://profiles.google.com/emma.brown"
  },
  {
    first_name: "Frank",
    last_name: "Davis",
    email: "frank.davis@example.com",
    phone: "555-0106",
    designation: :coach,
    facebook_profile_url: "https://facebook.com/frank.davis",
    twitter_profile_url: "https://twitter.com/frank_davis",
    linkedin_profile_url: "https://linkedin.com/in/frankdavis",
    google_profile_url: "https://profiles.google.com/frank.davis"
  },
  {
    first_name: "Grace",
    last_name: "Wilson",
    email: "grace.wilson@example.com",
    phone: "555-0107",
    designation: :doctor,
    facebook_profile_url: "https://facebook.com/grace.wilson",
    twitter_profile_url: "https://twitter.com/grace_wilson",
    linkedin_profile_url: "https://linkedin.com/in/gracewilson",
    google_profile_url: "https://profiles.google.com/grace.wilson"
  },
  {
    first_name: "Henry",
    last_name: "Taylor",
    email: "henry.taylor@example.com",
    phone: "555-0108",
    designation: :nutritionist,
    facebook_profile_url: "https://facebook.com/henry.taylor",
    twitter_profile_url: "https://twitter.com/henry_taylor",
    linkedin_profile_url: "https://linkedin.com/in/henrytaylor",
    google_profile_url: "https://profiles.google.com/henry.taylor"
  }
]

teams.each do |team_attrs|
  Team.create!(team_attrs)
end

puts "Seeded #{Team.count} teams!"
