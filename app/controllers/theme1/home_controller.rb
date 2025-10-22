class Theme1::HomeController < ApplicationController
  layout "theme1/application"

  def home
    @programs = Program.active.order(created_at: :desc).limit(3)
    @faqs = Faq.active.order(position: :asc).limit(6)
    @faq_banner = FaqBanner.first
    @testimonial_banner = TestimonialBanner.first
    @testimonials = Testimonial.approved.order(created_at: :desc).limit(6)
    @program_banner = ProgramBanner.first
    @team_banner = TeamBanner.first
    @team = Team.all.order(created_at: :desc).limit(6)
  end

  def programs
    @program_banner = ProgramBanner.first
    @programs = Program.active.order(created_at: :desc)
  end

  def show_program
    @program = Program.find_by(id: params[:id])

    unless @program
      redirect_to theme1_home_programs_path, alert: "Program not found"
    end
  end

  def faqs
    @faq_banner = FaqBanner.first
    @faqs = Faq.active.order(position: :asc)
  end
end
