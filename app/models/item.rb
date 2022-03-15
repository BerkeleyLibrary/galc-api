class Item < ApplicationRecord

  ALL_ATTRS = Item.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - [:id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at]).freeze

  validates :mms_id, uniqueness: true
  validates :bib_number, uniqueness: true

  validates :title, presence: true

  # TODO: figure out when we can enforce this
  # validates :image, presence: true
  # validates :artist, presence: true
  # validates :decade, presence: true
end
