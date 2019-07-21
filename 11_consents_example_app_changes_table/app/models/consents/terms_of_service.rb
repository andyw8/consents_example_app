module Consents
  class TermsOfService < Consent
    def terms_of_service
      accepted?
    end

    def terms_of_service=(value)
      update_consent(value)
    end
  end
end
