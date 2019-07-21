class Consent < ApplicationRecord
  belongs_to :registration

  has_many :consent_changes, autosave: true

  def accepted_at
    consent_changes.where(kind: "accept").last&.created_at
  end

  def withdrawn_at
    consent_changes.where(kind: "reject").last&.created_at
  end

  def accepted?
    consent_changes.last&.kind == "accept"
  end

  def rejected?
    consent_changes.last&.kind == "reject"
  end
end
