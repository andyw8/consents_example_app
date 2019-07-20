class AddTermsOfServiceToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :terms_of_service, :boolean, null: false
  end
end
