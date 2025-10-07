class Theme1::HomeController < ApplicationController
  layout "theme1/application"

  def home
    @programs = Program.active.order(created_at: :desc).limit(3)
    @faqs = Faq.active.order(position: :asc).limit(6)
  end

  def programs
    @programs = Program.active.order(created_at: :desc)
  end

  def show_program
    @program = Program.find_by(id: params[:id])

    unless @program
      redirect_to theme1_home_programs_path, alert: 'Program not found'
    end
  end
end
