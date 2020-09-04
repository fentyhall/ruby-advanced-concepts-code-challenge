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