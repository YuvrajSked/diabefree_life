TestimonialBanner.delete_all
Testimonial.delete_all
puts 'Creating sample testimonial Banners...'

testimonial_banner_data = [
  {
    title: "Client’s Testimonials",
    subtitle: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using.",
    description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using."
  }
]

testimonial_banner_data.each do |testimonial_banner_attrs|
  testimonial_banner = TestimonialBanner.find_or_initialize_by(title: testimonial_banner_attrs[:title])
  testimonial_banner.update!(testimonial_banner_attrs)
end
puts "Seeded #{TestimonialBanner.count} testimonial banners"



puts 'Creating sample Testimonials...'

testimonials_data = testimonials = [
  {
    name: "Aftab",
    age: 36,
    location: "Assam",
    content: "I was on heavy type 2 diabetes medication for 4 years, around 4 pills a day. Even the best medicine for type 2 diabetes didn't work. Then a friend who had diabetes told me about Breathe Well-being and since then, my health has only improved. I no longer have to take diabetes medication. Not a single pill! It's an amazing, easy to follow program. Highly recommended!",
    hba1c_before: 9.2,
    hba1c_after: 5.8,
    weight_before: 85.0,
    weight_after: 76.5,
    bgl_before: 210.0,
    bgl_after: 110.0,
    program_duration: 6,
    approved: true
  },
  {
    name: "Atanu Majumder",
    age: 48,
    location: "Kolkata",
    content: "When I was diagnosed with type 2 diabetes, I was told that my eating habits were the cause. But I just couldn't resist good food. So Breathe Well-being helped me replace my favorite meals with healthier ones that tasted equally delicious. And it was the perfect solution! My blood sugar levels started dropping and now I don't need any diabetes medication.",
    hba1c_before: 8.7,
    hba1c_after: 5.4,
    weight_before: 92.0,
    weight_after: 80.0,
    bgl_before: 200.0,
    bgl_after: 105.0,
    program_duration: 8,
    approved: true
  },
  {
    name: "Deepa Nair",
    age: 50,
    location: "Mumbai",
    content: "I am so much more active and fit than I ever was. Before joining Breathe's program, I had hbA1c levels of more than 9.4 and nothing seemed to work. But within just 8 months, my health has taken a remarkable turn. I achieved hba1c normal range - 5.2 in just 7 months and I lost 12 kgs too!",
    hba1c_before: 9.4,
    hba1c_after: 5.2,
    weight_before: 78.0,
    weight_after: 66.0,
    bgl_before: 220.0,
    bgl_after: 100.0,
    program_duration: 7,
    approved: true
  },
  {
    name: "Shweta Bansal",
    age: 45,
    location: "Ludhiana",
    content: "I didn't believe that type 2 diabetes can be reversed naturally, but Breathe Well-being changed my thinking. They found my type 2 diabetes causes, suggested little diet & lifestyle changes and it worked wonders! Now I have hbA1c normal range and there are no type 2 diabetes symptoms.",
    hba1c_before: 8.9,
    hba1c_after: 5.6,
    weight_before: 80.0,
    weight_after: 70.5,
    bgl_before: 195.0,
    bgl_after: 105.0,
    program_duration: 12,
    approved: true
  },
  {
    name: "Nihar Ranjan Kalita",
    age: 48,
    location: "Guwahati",
    content: "I had high blood sugar levels for 3 years. They didn't go down below 210 mg/dL even after trying everything. Luckily, I found out about Breathe Well-being's diabetes reversal program. Within 6 months only, my blood sugar levels dropped to 110-120 mg/dL. And now, I don't have diabetes anymore.",
    hba1c_before: 10.1,
    hba1c_after: 5.9,
    weight_before: 95.0,
    weight_after: 80.0,
    bgl_before: 230.0,
    bgl_after: 115.0,
    program_duration: 6,
    approved: true
  }
]



testimonials_data.each do |testimonial_attrs|
  Testimonial.find_or_create_by!(name: testimonial_attrs[:name]) do |testimonial|
    testimonial.assign_attributes(testimonial_attrs)
  end
end
puts "Seeded #{Testimonial.count} testimonials"
