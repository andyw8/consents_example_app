class Consent < ApplicationRecord
  belongs_to :registration

  def terms_of_service
    terms_of_service_accepted_at.present?
  end

  def subscribe_to_newsletter
    subscribe_to_newsletter_accepted_at.present?
  end

  def subscribe_to_newsletter=(value)
    case value
    when "1"
      self.subscribe_to_newsletter_accepted_at = Time.now
    when "0"
      self.subscribe_to_newsletter_accepted_at = nil
    else
      raise "Unexpected value '#{value}'"
    end
  end

  def terms_of_service=(value)
    if value == "1"
      self.terms_of_service_accepted_at = Time.now
    end
  end
end
