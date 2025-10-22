# Clear existing FAQs
FaqBanner.delete_all
Faq.delete_all

faq_banner_data= [
  {
    title: "Frequently Asked Questions",
    subtitle: "Find answers to common questions about our diabetes reversal program",
    description: "Find answers to common questions about our diabetes reversal program"
  }
]

faq_banner_data.each do |faq_banner_attrs|
  FaqBanner.create!(faq_banner_attrs)
  puts "Created FAQ Banner: #{faq_banner_attrs[:title]}"
end

puts "Successfully created #{FaqBanner.count} FAQ Banners!"

puts 'Creating sample FAQs...'

faqs = [
  {
    question: 'Can diabetes really be reversed naturally?',
    answer: 'Yes! Type 2 diabetes can be reversed through sustainable lifestyle changes. Our program has helped 2000+ patients achieve normal HbA1c levels and reduce or eliminate medications.',
    position: 1,
    active: true
  },
  {
    question: 'How long does it take to see results?',
    answer: 'Most patients see significant improvements in blood sugar levels within 30-60 days. Complete reversal typically occurs within 3-6 months with proper adherence to the program.',
    position: 2,
    active: true
  },
  {
    question: 'Is the program suitable for all ages?',
    answer: 'Our program is designed for adults with Type 2 diabetes. We customize the approach based on age, health status, and individual needs during the consultation.',
    position: 3,
    active: true
  },
  {
    question: 'Will I need to take medications forever?',
    answer: 'Many of our patients are able to reduce or eliminate their diabetes medications under medical supervision. However, this depends on individual health conditions and progress in the program.',
    position: 4,
    active: true
  },
  {
    question: 'What makes your program different from others?',
    answer: 'Our program combines evidence-based nutrition, personalized exercise plans, stress management, and continuous medical supervision. We focus on sustainable lifestyle changes rather than quick fixes.',
    position: 5,
    active: true
  }
]

faqs.each do |faq_attrs|
  Faq.create!(faq_attrs)
  puts "Created FAQ: #{faq_attrs[:question]}"
end

puts "Successfully created #{Faq.count} FAQs!"
