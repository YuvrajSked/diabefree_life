ProgramBanner.delete_all
Program.delete_all

puts 'Creating sample Program Banners...'

program_banner_data = [
  {
    title: "We Offer Great Affordable Program For Reverse Diabetes.",
    subtitle: "Discover our most popular diabetes reversal programs designed to help you achieve sustainable results.",
    description: "Discover our most popular diabetes reversal programs designed to help you achieve sustainable results."
  }
]

program_banner_data.each do |program_banner_attrs|
  program_banner = ProgramBanner.find_or_initialize_by(title: program_banner_attrs[:title])
  program_banner.update!(program_banner_attrs)
end
puts "Seeded #{ProgramBanner.count} program banners"


puts 'Creating sample Programs...'

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
