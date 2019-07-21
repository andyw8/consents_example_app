class AddSubscribeToNewsletterToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :subscribe_to_newsletter_accepted_at, :datetime
  end
end
