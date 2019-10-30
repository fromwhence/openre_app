class Property < ApplicationRecord
  has_many :open_houses
  has_many :photos
  belongs_to :realtor
  has_many :interests
  has_many :buyers, through: :interests
end
