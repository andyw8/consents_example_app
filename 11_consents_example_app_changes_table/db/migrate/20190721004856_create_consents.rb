class CreateConsents < ActiveRecord::Migration[5.2]
  def change
    create_table :consents do |t|
      t.string :type, null: false
      t.references :registration, foreign_key: true, null: false
    end
  end
end
