class Registration < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :terms_of_service, acceptance: true

  def terms_of_service=(value)
    if value == "1"
      self.terms_of_service_accepted_at = Time.now
    end
  end

  def terms_of_service
    terms_of_service_accepted_at.present?
  end
end
