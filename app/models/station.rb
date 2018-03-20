class Station < ApplicationRecord
  # attr_reader :latitude, :longitude
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
