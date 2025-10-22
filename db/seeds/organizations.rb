# Clear old data
Address.destroy_all
Organization.destroy_all

puts "Creating organizations with addresses..."

Organization.create!(
  name: "DiabeFree Life",
  sort_name: "DiabeFree Life",
  description: "Reversal is not a luxury but an absolute necessity...",
  short_description: "Reversal is not a luxury but an absolute necessity...",
  email: "diabefree.life@gmail.com",
  phone: "1234567890",
  status: true,
  linkedin_profile_url: "https://www.linkedin.com/company/diabefree-life",
  facebook_profile_url: "https://www.facebook.com/diabefree-life",
  twitter_profile_url: "https://twitter.com/diabefree-life",
  google_profile_url: "https://diabefree-life.com",
  address_attributes: {
    street: "123 Innovation Drive",
    city: "Indore",
    state: "Madhya Pradesh",
    country: "India",
    pincode: "452001"
  }
)



puts "✅ Created #{Organization.count} organizations and #{Address.count} addresses."
