module Consents
  class SubscribeToNewsletter < Consent
    self.table_name = "consents"

    def subscribe_to_newsletter
      accepted?
    end

    def subscribe_to_newsletter=(value)
      if value == "1" && !accepted?
        consent_changes.build(kind: "accept")
      elsif value == "0" && !rejected?
        consent_changes.build(kind: "reject")
      end
    end
  end
end
