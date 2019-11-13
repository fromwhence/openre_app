class OpenHouse < ApplicationRecord
  belongs_to :property
  has_one :realtor, through: :property
  has_many :interests, through: :property
  has_many :buyers, through: :interests

  def friendly_start_time
  	start_time.strftime("%a. %m/%d, %l%P-")
  end

  def friendly_end_time
  	end_time.strftime("%l%P").gsub(" ","")
  end

  # end
end
