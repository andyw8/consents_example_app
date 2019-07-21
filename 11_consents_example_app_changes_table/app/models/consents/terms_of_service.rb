module Consents
  class TermsOfService < Consent
    self.table_name = "consents"

    # validates :name, inclusion: { in: ['terms_of_service'] }, strict: true

    def terms_of_service
      consent_changes.last&.kind == "accept"
    end

    def terms_of_service=(value)
      if value == "1"
        consent_changes.build(kind: "accept")
      end
    end
  end
end
