class Location < ApplicationRecord
    has_many :addresses
    has_many :humans
end
