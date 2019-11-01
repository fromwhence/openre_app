class Property < ApplicationRecord
  has_many :open_houses
  has_many :photos
  belongs_to :realtor
  has_many :interests
  has_many :buyers, through: :interests
  enum category: {single_family: 0, condo: 1, townhome: 2, multi_family: 3}
end
