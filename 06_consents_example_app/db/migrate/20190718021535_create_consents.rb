class CreateConsents < ActiveRecord::Migration[5.2]
  def change
    create_table :consents do |t|
      t.datetime :terms_of_service_accepted_at
      t.datetime :subscribe_to_newsletter_accepted_at
      t.references :registration, foreign_key: true

      t.timestamps
    end
  end
end
