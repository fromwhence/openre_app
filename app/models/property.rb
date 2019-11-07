class Property < ApplicationRecord
  has_many :open_houses
  has_many :photos
  belongs_to :realtor
  has_many :interests
  has_many :buyers, through: :interests
  enum home_category: {single_family: 0, condo: 1, townhome: 2, multi_family: 3}

  def formatted_home_category
    home_category.gsub('_',"-").titleize
  end

  def home_category_number
  	Property.home_categories[home_category]
  end

end
