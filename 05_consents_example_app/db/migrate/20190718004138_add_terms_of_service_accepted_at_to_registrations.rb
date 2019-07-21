class AddTermsOfServiceAcceptedAtToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :terms_of_service_accepted_at, :datetime, null: false
  end
end
