# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Welcome message
    div class: "blank_slate_container mb-2", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome to DiabeFree Life Admin"
      end
    end

    # # Recent testimonials
    # panel "Recent Testimonials" do
    #   if Testimonial.any?
    #     table_for Testimonial.order(created_at: :desc).limit(5) do
    #       column :name do |testimonial|
    #         link_to testimonial.name, admin_testimonial_path(testimonial)
    #       end
    #       column :location
    #       column :hba1c_improvement do |testimonial|
    #         "#{(testimonial.hba1c_before - testimonial.hba1c_after).round(1)}%"
    #       end
    #       column :featured do |testimonial|
    #         testimonial.featured? ? "⭐" : ""
    #       end
    #       column :created_at do |testimonial|
    #         time_ago_in_words(testimonial.created_at) + " ago"
    #       end
    #     end
    #   else
    #     para "No testimonials yet. #{link_to('Add the first one!', new_admin_testimonial_path)}"
    #   end
    # end

    # Programs overview
    panel "Programs Overview" do
      if Program.any?
        table_for Program.order(:program_type) do
          column :title do |program|
            link_to program.title, admin_program_path(program)
          end
          column :type do |program|
            program.program_type.humanize
          end
          column :price do |program|
            "₹#{program.price.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
          end
          column :status do |program|
            program.active? ? "Active" : "Inactive"
          end
        end
      else
        para "No programs yet. #{link_to('Add the first one!', new_admin_program_path)}"
      end
    end

    # Recent FAQs Table
    panel "Recent FAQs" do
      recent_faqs = Faq.ordered.limit(5)
      if recent_faqs.any?
        table_for recent_faqs do
          column "Question" do |faq|
            q = faq.question.to_s[0..49]
            link_to q, admin_faq_path(faq)
          end
          column "Answer" do |faq|
            faq.answer.to_s[0..69] + (faq.answer.to_s.length > 70 ? "..." : "")
          end
          column "Status" do |faq|
            status_tag faq.active? ? "active" : "inactive", class: faq.active? ? "status active" : "status inactive"
          end
          column "Created" do |faq|
            time_ago_in_words(faq.created_at) + " ago"
          end
        end
      else
        para "No FAQs yet. #{link_to('Add the first one!', new_admin_faq_path)}"
      end
    end

    # Quick actions
    panel "Quick Actions" do
      div style: "text-align: center;" do
        link_to "View Website", root_path, target: "_blank",
                class: "button", style: "margin: 0 10px;"
      end
    end
  end # content
end
