class Registration < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :terms_of_service, acceptance: true

  has_one :consent, autosave: true

  delegate :terms_of_service,
    :terms_of_service=,
    :subscribe_to_newsletter,
    :subscribe_to_newsletter=,
    to: :consent

  def consent
    super || build_consent
  end
end
