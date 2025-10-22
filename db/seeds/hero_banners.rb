HeroBanner.delete_all
puts "Creating Hero Banners..."

hero_banner_data = [
  {
    title: "Reverse Your Diabetes Naturally.",
    subtitle: "Join Anoop Gupta's proven diabetes reversal program.",
    description: "Join Anoop Gupta's proven diabetes reversal program. Transform your life with sustainable lifestyle changes backed by clinical results.",
    rating: 4.8,
    patient_count: 2000
  }
]

hero_banner_data.each do |hero_banner_attrs|
  HeroBanner.create!(hero_banner_attrs)
  puts "Created Hero Banner: #{hero_banner_attrs[:title]}"
end

puts "Successfully created #{HeroBanner.count} Hero Banners!"
