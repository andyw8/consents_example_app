module Consents
  class SubscribeToNewsletter < Consent
    def subscribe_to_newsletter
      accepted?
    end

    def subscribe_to_newsletter=(value)
      update_consent(value)
    end
  end
end
