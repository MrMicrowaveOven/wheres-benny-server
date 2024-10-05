class Location < ApplicationRecord
    has_many :addresses
    has_many :humans

    scope :active, lambda {where(active: true)}
end
