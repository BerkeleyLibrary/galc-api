class Item < ApplicationRecord
  validates :mms_id, uniqueness: true
  validates :bib_number, uniqueness: true

  validates :title, presence: true

  # TODO: figure out when we can enforce this
  # validates :image, presence: true
  # validates :artist, presence: true
  # validates :decade, presence: true
end
