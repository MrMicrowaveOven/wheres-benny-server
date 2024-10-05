class LocationsController < ApplicationController
  def index
    locations_array = Location.active.all
    locations_array = locations_array.sort_by(&:id)
    locations_with_addresses = locations_array.map do |location|
      location.attributes.merge({addresses: location.addresses.map {|address| address.address_string}})
    end
    render :json => locations_with_addresses
  end
end
