class Consent < ApplicationRecord
  belongs_to :registration

  has_many :consent_changes, autosave: true, dependent: :destroy

  def accepted?
    consent_changes.last&.kind == "accept"
  end

  def rejected?
    consent_changes.last&.kind == "reject"
  end

  def update_consent(value)
    if value == "1" && !accepted?
      consent_changes.build(kind: "accept")
    elsif value == "0" && !rejected?
      consent_changes.build(kind: "reject")
    end
  end
end
