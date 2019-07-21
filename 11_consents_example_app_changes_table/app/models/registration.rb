class Registration < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :terms_of_service, acceptance: true

  has_many :consents
  has_many :consent_changes, through: :consents

  # TODO: dependent settings
  has_one :subscribe_to_newsletter_consent, class_name: "Consents::SubscribeToNewsletter", autosave: true
  has_one :terms_of_service_consent, class_name: "Consents::TermsOfService", autosave: true

  delegate :subscribe_to_newsletter, :subscribe_to_newsletter=, to: :subscribe_to_newsletter_consent
  delegate :terms_of_service, :terms_of_service=, to: :terms_of_service_consent

  def subscribe_to_newsletter_consent
    super || build_subscribe_to_newsletter_consent(registration: self)
  end

  def terms_of_service_consent
    super || build_terms_of_service_consent(registration: self)
  end
end
