class Human < ApplicationRecord
    belongs_to :location, optional: true

    def check_location
        active_location = nil
        Location.active.all.each do |location|
            is_here = is_in_location(location)
            if is_here
                active_location = location
                break
            end
        end
        update(location: active_location)
    end

    private

    def is_in_location(location)
        lat1 = location.lat1
        lng1 = location.lng1
        lat2 = location.lat2
        lng2 = location.lng2
        lat3 = location.lat3
        lng3 = location.lng3
        lat4 = location.lat4
        lng4 = location.lng4

        slope1 = get_slope([lat1, lng1], [lat2, lng2])
        lng_at_lng_1 = slope1 * (lat1 - lat) + lng1
        aboveLine1 = lng_at_lng_1 > lng

        slope2 = get_slope([lat2, lng2], [lat3, lng3])
        lng_at_lng_2 = slope2 * (lat2 - lat) + lng2
        aboveLine2 = lng_at_lng_2 > lng

        slope3 = get_slope([lat3, lng3], [lat4, lng4])
        lng_at_lng_3 = slope3 * (lat3 - lat) + lng3
        aboveLine3 = lng_at_lng_3 > lng

        slope4 = get_slope([lat4, lng4], [lat1, lng1])
        lng_at_lng_4 = slope4 * (lat4 - lat) + lng4
        aboveLine4 = lng_at_lng_4 > lng

        above1xor3 = (aboveLine1 && !aboveLine3) || (!aboveLine1 && aboveLine3)
        above2xor4 = (aboveLine2 && !aboveLine4) || (!aboveLine2 && aboveLine4)

        matchesAddress = false
        if !(above1xor3 && above2xor4)
            matchesAddress = checkIfAddressMatches(location.addresses)
        end
        (above1xor3 && above2xor4) || matchesAddress
    end

    def get_slope(location1, location2)
        numerator = location1[0] - location2[0]
        denominator = location1[1] - location2[1]
        numerator / denominator
    end

    def checkIfAddressMatches(addresses)
        addresses.each do |address|
        end
    end
end
