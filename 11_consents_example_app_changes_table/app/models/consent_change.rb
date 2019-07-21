class ConsentChange < ApplicationRecord
  belongs_to :consent

  scope :accepted, -> { where(kind: "accept") }
  scope :rejected, -> { where(kind: "accept") }
end
