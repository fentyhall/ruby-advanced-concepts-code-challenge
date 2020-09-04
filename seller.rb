# 1. Add a `Seller` class, representing a person listing a new home, with the following relationships:
# * `Listing` belongs to `Seller`
# * `Seller` has many `Listings`
# * `Agent` has many `Sellers` through `Listings`
# * `Seller` has many `Agents` through `Listings`
# 2. Raise a custom error in the `Listing#price_drop` method if a user passes in anything less than 0 or greater than 1
# 3. Refactor the `#initialize` method(s) to accept a hash as an argument and use the `send` method to dynamically assign the hash values to instance variables
# 4. Use the `Adapter` class to fetch data from a real estate API OR webpage.

class Seller 
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def listings 
        Listing.all.select {|listing| listing.seller == self}
    end 

    def agents 
        self.listings.map {|listing| listing.agent}
    end 
end 