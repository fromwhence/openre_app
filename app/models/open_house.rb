class OpenHouse < ApplicationRecord
  belongs_to :property
  has_one :realtor, through: :property
  has_many :interests, through: :property
  has_many :buyers, through: :interests
  # def friendly_timestamp

  # end
end
