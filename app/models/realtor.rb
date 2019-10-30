class Realtor < User
  has_many :properties
  has_many :open_houses, through: :properties
end