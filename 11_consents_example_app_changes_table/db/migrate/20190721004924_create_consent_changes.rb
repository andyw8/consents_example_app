class CreateConsentChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :consent_changes do |t|
      t.string :kind, null: false
      t.references :consent, foreign_key: true, null: false

      t.timestamps
    end
  end
end
