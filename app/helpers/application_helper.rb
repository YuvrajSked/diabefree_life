module ApplicationHelper
  def current_organization_light_logo_url
    # organization.image.variant(format: :png)
    active_storage_url(Organization.first&.light_logo_image, "theme1/DiabeFree Life 4.svg")
  end

  def current_organization_dark_logo_url
    # organization.image.variant(format: :png)
    active_storage_url(Organization.first&.dark_logo_image, "theme1/DiabeFree Life 3.svg")
  end

  def active_storage_url(resource, default_url = "#")
    if resource.is_a?(ActiveStorage::Attached::One)
      resource.attached? ? valid_active_storage_url?(resource.attachment, default_url) : default_url
    elsif resource.is_a?(String)
      valid_url?(resource) ? resource : default_url

    else
      resource.blank? ? default_url : url_for(resource)
    end
  end

  def valid_active_storage_url?(attachment, default_url)
    if attachment&.blob&.persisted?
      rails_blob_url(attachment)
    else
      default_url
    end
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end

  def organization_facebook_url
    Organization.first&.facebook_profile_url.presence || "-"
  end

  def organization_linkedin_url
    Organization.first&.linkedin_profile_url.presence || "-"
  end

  def organization_twitter_url
    Organization.first&.twitter_profile_url.presence || "-"
  end

  def organization_google_url
    Organization.first&.google_profile_url.presence || "-"
  end

  def organization_email
    Organization.first&.email.presence || "example@example.com"
  end

  def organization_address
    Organization.first&.address&.full_address.presence || "ABC-DEF"
  end

  def organization_phone
    Organization.first&.phone.presence || "**********"
  end


  def star_rating(rating, max_stars: 5)
    rating = rating.to_f
    full_stars = rating.floor
    half_star = (rating - full_stars >= 0.5)
    empty_stars = max_stars - full_stars - (half_star ? 1 : 0)

    # Build HTML for stars
    stars_html = ""

    # Full stars (bright yellow)
    full_stars.times do
      stars_html += content_tag(:i, "", class: "fa-solid fa-star text-xl", style: "color: yellow;")
    end

    # Half star (bright yellow)
    stars_html += content_tag(:i, "", class: "fa-solid fa-star-half-stroke text-xl", style: "color: yellow;") if half_star

    # Empty stars (gray)
    empty_stars.times do
      stars_html += content_tag(:i, "", class: "fa-regular fa-star text-gray-300 text-xl")
    end

    stars_html.html_safe
  end
end
