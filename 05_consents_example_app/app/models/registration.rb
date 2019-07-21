class Registration < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :terms_of_service, acceptance: true

  def subscribe_to_newsletter=(value)
    self.subscribe_to_newsletter_accepted_at = case value
                                               when "1"
                                                 Time.now
                                               when "0"
                                                 nil
                                               else
                                                 raise "Unexpected value '#{value}'"
                                               end
  end

  def subscribe_to_newsletter
    subscribe_to_newsletter_accepted_at.present?
  end

  def terms_of_service=(value)
    if value == "1"
      self.terms_of_service_accepted_at = Time.now
    end
  end

  def terms_of_service
    terms_of_service_accepted_at.present?
  end
end
