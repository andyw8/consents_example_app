class SubscribeToNewsletterConsent < Consent
  validates :name, inclusion: { in: ['subscribe_to_newsletter'] }, strict: true

  def subscribe_to_newsletter
    accepted_at.present?
  end

  def subscribe_to_newsletter=(value)
    self.accepted_at = if value == "1"
                         Time.zone.now
                       else
                         nil
                       end
  end
end
