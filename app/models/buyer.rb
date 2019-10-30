class Buyer < User
  has_many :interests
  has_many :properties, through: :interests
  has_many :open_houses, through: :properties
end