class LocationsController < ApplicationController
  def index
    locations_array = Location.all
    locations_with_addresses = locations_array.map do |location|
      location.attributes.merge({addresses: location.addresses.map {|address| address.address_string}})
    end
    render :json => locations_with_addresses
  end
end
